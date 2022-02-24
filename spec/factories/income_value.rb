FactoryBot.define do
    factory :income_value do
    association :user
    association :income
    content     { Faker::Lorem.words }
    start_time  { Faker::Date.backward }
    value       { Faker::Number.number }
    description { Faker::Lorem.words }
    code        { Faker::Number.number(1)}
  end
end