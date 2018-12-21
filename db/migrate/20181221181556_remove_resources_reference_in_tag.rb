class RemoveResourcesReferenceInTag < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :resource_id
  end
end
