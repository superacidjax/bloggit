class DropTaggableFieldsFromTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :taggable_type, :string
    remove_column :tags, :taggable_id, :integer
  end
end
