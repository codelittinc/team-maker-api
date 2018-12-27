resource_types = [
  { name: 'Employee' },
  { name: 'Contractors' }
]

resource_types.each { |resource_type_attrs| ResourceType.find_or_create_by(resource_type_attrs) }
