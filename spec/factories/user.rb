FactoryBot.define do
#Faker::Fakerを使用する時の宣言。Loremダミーテキストタイプを指定。characters文字列を作成。number生成文字数の指定。
  factory :user do
    name                  { Faker::Lorem.characters(number: 10) }
    email                 { Faker::Internet.email }
    introduction          { 'introduction' }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end