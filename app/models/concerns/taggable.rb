module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def tag(label)
    label.strip!
    tag = Tag.find_or_create_by(label: label)
    self.taggings.find_or_create_by(tag_id: tag.id)
  end

  def tag_list
    tags.map(&:label).join(", ")
  end

  def tag_list=(labels)
    if self.id
      labels.split(",").map do |label|
        tag(label)
      end
    end
  end
end
