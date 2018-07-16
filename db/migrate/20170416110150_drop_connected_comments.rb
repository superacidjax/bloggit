class DropConnectedComments < ActiveRecord::Migration[5.0]
  def change
    drop_table :connected_comments
  end
end
