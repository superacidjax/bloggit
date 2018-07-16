class AddBlogPostIdToBlogPostAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_post_attachments, :blog_post_id, :integer, null: false
    add_index :blog_post_attachments, :blog_post_id
  end
end
