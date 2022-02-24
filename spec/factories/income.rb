FactoryBot.define do
  factory :income do
    association :user
    name        {'name'}
    description {'description'}
  end
end