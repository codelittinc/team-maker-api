class AddScheduleReferencesInPeriod < ActiveRecord::Migration[5.2]
  def change
    add_reference :periods, :schedule, foreign_key: true
  end
end
