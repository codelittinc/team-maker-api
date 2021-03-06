class ProjectStatus < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :projects
end