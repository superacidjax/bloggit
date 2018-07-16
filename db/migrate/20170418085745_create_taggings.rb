class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.string :taggable_type
      t.integer :taggable_id
    end
    add_index :taggings, :tag_id
    add_index :taggings, :taggable_type
    add_index :taggings, :taggable_id
  end
end
