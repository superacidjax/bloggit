class BlogPostAttachment < ApplicationRecord
  include Taggable

  enum media_type: [ 'Image', 'Video' ]
  self.inheritance_column = 'media_type'
  belongs_to :blog_post, touch: true
  has_many :comments, as: :parent
end
