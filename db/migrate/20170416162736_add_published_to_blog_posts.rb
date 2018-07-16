class AddPublishedToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :published, :boolean, null: false, default: false
    add_index :blog_posts, :published
  end
end
