class Resource < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :schedules

  belongs_to :role
  belongs_to :resource_type
  belongs_to :tag, optional: true
end
