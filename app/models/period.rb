class Period < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  has_many :schedules
end
