class CreateScheduleType < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_types do |t|
      t.string :name
    end
  end
end
