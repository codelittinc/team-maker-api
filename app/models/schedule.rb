class Schedule < ApplicationRecord
  belongs_to :project
  belongs_to :period
  belongs_to :schedule_type
  belongs_to :resource
end
