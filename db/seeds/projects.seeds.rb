projects = [
  { name: 'Aero',
    project_status_id: 1 },
  { name: 'Spider',
    project_status_id: 1 },
  { name: 'InSite',
    project_status_id: 1 },
  { name: 'AssureDrive',
    project_status_id: 1 },
  { name: 'VAS',
    project_status_id: 1 },
  { name: 'A-enroll',
    project_status_id: 1 },
  { name: 'Lease Comps',
    project_status_id: 1 }
]

projects.each { |project_attrs| Project.find_or_create_by(project_attrs) }
