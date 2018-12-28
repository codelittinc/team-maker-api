schedule_types = [
  { name: 'Permanent' },
  { name: 'Temporary Replacement' }
]

schedule_types.each { |schedule_type_attrs| ScheduleType.find_or_create_by(schedule_type_attrs) }
