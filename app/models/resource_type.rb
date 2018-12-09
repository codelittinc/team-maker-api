class ResourceType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
