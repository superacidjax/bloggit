class BlogPost < ApplicationRecord
  include Taggable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :author, class_name: 'User', foreign_key: :user_id, touch: true
  has_many :comments, as: :parent, dependent: :destroy
  has_many :blog_post_attachments, dependent: :destroy

  validates :title, :body, presence: true

  def self.tagged_with(label)
    if tagged  = Tag.includes(:blog_posts).where(label: label).last
      tagged.blog_posts
    end
  end
end
