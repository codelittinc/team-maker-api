periods = [
  { starts_at: '2018/10/01', ends_at: '2018/12/15' },
  { starts_at: '2018/10/01', ends_at: '2018/12/31' },
  { starts_at: '2018/10/01', ends_at: '2018/11/30' },
  { starts_at: '2018/12/08', ends_at: '2018/12/31' },
  { starts_at: '2018/12/01', ends_at: '2018/12/31' },
  { starts_at: '2018/11/07', ends_at: '2018/12/31' },
  { starts_at: '2018/10/01', ends_at: '2018/11/22' },
  { starts_at: '2018/11/23', ends_at: '2018/11/30' },
  { starts_at: '2018/10/15', ends_at: '2018/12/31' }
]

periods.each { |period_attrs| Period.find_or_create_by(period_attrs) }


Period.find_or_create_by({ starts_at: '2018/10/01', ends_at: '2018/11/30' })
