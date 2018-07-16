class CreateConnectedComments < ActiveRecord::Migration[5.0]
  def change
    create_table :connected_comments do |t|
      t.integer :blog_post_comment_id, index: true, foreign_key: true, null: false
      t.integer :nested_comment_id, index: true, null: false

      t.timestamps
    end
    add_foreign_key :connected_comments, :blog_post_comments,
      column: :nested_comment_id
    add_index :connected_comments, [:blog_post_comment_id, :nested_comment_id],
      unique: true, name: 'connected_comments_index'
  end
end
