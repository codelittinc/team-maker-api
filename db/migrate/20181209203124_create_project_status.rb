class CreateProjectStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :project_statuses do |t|
      t.string :name
    end
  end
end
