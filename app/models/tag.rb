class Tag < ApplicationRecord
  validates :name, presence: true

  has_many :resource_tags
end
