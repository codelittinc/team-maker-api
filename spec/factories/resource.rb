FactoryBot.define do
  factory :resource do
    name { Faker::HitchhikersGuideToTheGalaxy.character }
    association :role
    association :resource_type
  end
end
