class CreateBlogPostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_post_comments do |t|
      t.references :user, index: true
      t.references :parent, index: true
      t.string :parent_type, index: true
      t.text :body
      t.timestamps
    end
  end
end
