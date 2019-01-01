FactoryBot.define do
  factory :period do
    starts_at { Faker::Date.backward(14).to_s }
    ends_at { Faker::Date.forward(23).to_s }
    association :schedule
  end
end
