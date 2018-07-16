class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy

  has_many :blog_posts, through: :taggings, source: :taggable,
    source_type: BlogPost
  has_many :comments, through: :taggings, source: :taggable,
    source_type: Comment
  has_many :blog_post_attachements, through: :taggings, source: :taggable,
    source_type: BlogPostAttachment
end
