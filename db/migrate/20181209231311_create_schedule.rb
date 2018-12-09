class CreateSchedule < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :project, foreign_key: true
      t.references :period, foreign_key: true
      t.references :resource, foreign_key: true
      t.references :schedule_type, foreign_key: true
    end
  end
end
