FactoryBot.define do
  factory :favorite do
    association :user
    association :variablecost_value
  end
end