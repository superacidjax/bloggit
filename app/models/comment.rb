class Comment < ApplicationRecord
  include Taggable

  belongs_to :commenter, class_name: 'User', foreign_key: :user_id, touch: true,
    counter_cache: true
  delegate :id, to: :commenter, prefix: true
  delegate :email, to: :commenter, prefix: true
  delegate :comments_count, to: :commenter, prefix: true
  belongs_to :parent, polymorphic: true
  has_many :comments, as: :parent, dependent: :destroy
  has_many :tags, as: :taggable

  validates :body, presence: true

end
