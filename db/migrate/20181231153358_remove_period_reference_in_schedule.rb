class RemovePeriodReferenceInSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :period_id
  end
end
