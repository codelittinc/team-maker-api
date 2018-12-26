class CreateResourceTag < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_tags do |t|
      t.references :resource, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
