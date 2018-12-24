class RemoveTagFromResources < ActiveRecord::Migration[5.2]
  def change
    remove_column :resources, :tag_id
  end
end
