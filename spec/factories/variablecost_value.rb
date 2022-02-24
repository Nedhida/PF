FactoryBot.define do
  factory :variablecost_value do
    association :user
    association :variablecost
    content     { Faker::Lorem.words }
    start_time  { Faker::Date.backward }
    value       { Faker::Number.number }
    description { Faker::Lorem.words }
    privacy     { Faker::Lorem.characters(number: 1) }
    code        { Faker::Number.number(1)}
  end
end