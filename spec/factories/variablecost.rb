FactoryBot.define do
  factory :variablecost do
    association :user
    name        {'name'}
    description {'description'}
  end
end