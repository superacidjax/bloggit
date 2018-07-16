class ChangeBlogPostTagsToTags < ActiveRecord::Migration[5.0]
  def change
    rename_table :blog_post_tags, :tags
  end
end
