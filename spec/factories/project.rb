FactoryBot.define do
  factory :project do
    name { Faker::App.name }
    association :project_status
  end
end
