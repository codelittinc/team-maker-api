class Period < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  belongs_to :schedule
end
