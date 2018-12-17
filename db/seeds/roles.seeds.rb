roles = [
  { name: 'Engineer' },
  { name: 'Engineer Leader' },
  { name: 'PM' },
  { name: 'Designer' },
  { name: 'Designer Lead' }
]

roles.each { |role_attrs| Role.find_or_create_by(role_attrs) }
