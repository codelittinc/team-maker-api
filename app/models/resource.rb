class Resource < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :schedules
  has_many :tags

  belongs_to :role
  belongs_to :resource_type
end
