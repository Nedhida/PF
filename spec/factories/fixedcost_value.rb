FactoryBot.define do
    factory :fixedcost_value do
    association :user
    association :fixedcost
    content     { Faker::Lorem.words }
    start_time  { Faker::Date.backward }
    value       { Faker::Number.number }
    description { Faker::Lorem.words }
    code        { Faker::Number.number(1)}
  end
end