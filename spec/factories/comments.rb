FactoryBot.define do
  factory :comment do
    comment     { 'コメント' }
    association :user
    association :variablecost_value
  end
end