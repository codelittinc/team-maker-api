class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :project_status
end