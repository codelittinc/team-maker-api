class AddTagReferencesInResources < ActiveRecord::Migration[5.2]
  def change
    add_reference :resources, :tag, foreign_key: true
  end
end
