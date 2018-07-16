class ChangeBlogPostCommentsToComments < ActiveRecord::Migration[5.0]
  def change
    rename_table :blog_post_comments, :comments
  end
end
