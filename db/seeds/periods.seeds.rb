periods = [
  { starts_at: '2018/10/01', ends_at: '2018/12/15', schedule_id: 1 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 2 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 3 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 4 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 5 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 6 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 7 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 8 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 9 },
  { starts_at: '2018/10/01', ends_at: '2018/11/30', schedule_id: 10 },
  { starts_at: '2018/12/08', ends_at: '2018/12/31', schedule_id: 11 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 12 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 13 },
  { starts_at: '2018/12/01', ends_at: '2018/12/31', schedule_id: 14 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 15 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 16 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 17 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 18 },
  { starts_at: '2018/11/07', ends_at: '2018/12/31', schedule_id: 19 },
  { starts_at: '2018/10/01', ends_at: '2018/12/15', schedule_id: 20 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 21 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 22 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 23 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 24 },
  { starts_at: '2018/10/01', ends_at: '2018/11/22', schedule_id: 25 },
  { starts_at: '2018/11/23', ends_at: '2018/11/30', schedule_id: 26 },
  { starts_at: '2018/12/01', ends_at: '2018/12/31', schedule_id: 27 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 28 },
  { starts_at: '2018/10/01', ends_at: '2018/12/31', schedule_id: 29 },
  { starts_at: '2018/10/15', ends_at: '2018/12/31', schedule_id: 30 },
  { starts_at: '2018/10/01', ends_at: '2018/11/22', schedule_id: 31 },
  { starts_at: '2018/10/01', ends_at: '2018/11/30', schedule_id: 32 },
  { starts_at: '2018/10/01', ends_at: '2018/11/30', schedule_id: 33 }
]

periods.each { |period_attrs| Period.find_or_create_by(period_attrs) }
