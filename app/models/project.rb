class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :schedules
  
  belongs_to :project_status
end