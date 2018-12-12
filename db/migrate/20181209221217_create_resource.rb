class CreateResource < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.references :role, foreign_key: true
      t.references :resource_type, foreign_key: true
    end
  end
end
