class AddDbConstraints < ActiveRecord::Migration[5.0]
  def change
    change_column :blog_post_attachments, :media_type, :integer, null: false
    change_column :blog_post_attachments, :url, :text, null: false, default: ''
    change_column :blog_post_attachments, :caption, :text, null: false, default: ''
    change_column :blog_post_attachments, :title, :text, null: false, default: ''
    change_column :blog_post_comments, :user_id, :integer, null: false
    change_column :blog_post_comments, :body, :text, null: false, default: ''
    change_column :blog_posts, :user_id, :integer, null: false
    change_column :blog_posts, :comment_count, :integer, null: false, default: 0
    change_column :blog_posts, :media_count, :integer, null: false, default: 0
    change_column :users, :comment_count, :integer, null: false, default: 0
  end
end
