class ScheduleType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
