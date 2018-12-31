class Schedule < ApplicationRecord
  has_one :period, dependent: :destroy

  belongs_to :project
  belongs_to :schedule_type
  belongs_to :resource
end
