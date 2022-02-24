FactoryBot.define do
  factory :fixedcost do
    association :user
    name        {'name'}
    description {'description'}
  end
end