class Resource < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :schedules
  has_many :resource_tags
  has_many :tags, through: :resource_tags

  belongs_to :role
  belongs_to :resource_type
end
