class Resource < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :role
  belongs_to :resource_type
end
