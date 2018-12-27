project_statuses = [
  { name: 'Project in progress' },
  { name: 'Project in hiatus' },
  { name: 'Project Complete' }
]

project_statuses.each { |project_status_attrs| ProjectStatus.find_or_create_by(project_status_attrs) }
