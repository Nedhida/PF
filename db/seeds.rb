# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  User.create!(
     email: "a#{n + 1}@a",
     name: "テスト#{n + 1}",
     password: "aaaaaa#{n + 1}"
  )
end

User.all.each do |user|
  7.times do |n|
    user.variablecosts.create!(
      name: "v項目#{n + 1}",
      description: "test#{n + 1}"
    )

    user.incomes.create!(
      name: "i項目#{n + 1}",
      description: "test#{n + 1}"
    )

    user.fixedcosts.create!(
      name: "f項目#{n + 1}",
      description: "test#{n + 1}"
    )

    user.variablecost_values.create!(
      variablecost_id: "#{n + 1}",
      content: "test#{n + 1}",
      start_time: "2022-02-0#{n + 1}",
      value: "#{n + 1}000",
      privacy: "1",
      code: "3"
    )

    user.income_values.create!(
      income_id: "#{n + 1}",
      content: "test#{n + 1}",
      start_time: "2022-0#{n + 1}-05",
      value: "#{n + 1}0000",
      code: "1"
    )

    user.fixedcost_values.create!(
      fixedcost_id: "#{n + 1}",
      content: "test#{n + 1}",
      start_time: "2022-02-0#{n + 1}",
      value: "#{n + 1}050",
      code: "2"
    )
  end
end