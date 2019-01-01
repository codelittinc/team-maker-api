FactoryBot.define do
  factory :schedule do
    association :project
    association :resource
    association :schedule_type
  end
end
