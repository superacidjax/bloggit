class CreateBlogPostAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_post_attachments do |t|
      t.text :title
      t.text :caption
      t.text :url
      t.integer :media_type
    end
  end
end
