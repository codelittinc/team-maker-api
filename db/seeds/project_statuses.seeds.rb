project_statuses = [
  { name: 'In progress' },
  { name: 'In hiatus' },
  { name: 'Complete' }
]

project_statuses.each { |project_status_attrs| ProjectStatus.find_or_create_by(project_status_attrs) }
