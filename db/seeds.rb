# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    User.create(
        email: Faker::Internet.email,
        password: Faker::Number.number(digits: 3)
    )
end

10.times do
    CaloriesRegister.create(
        calories: Faker::Number.number(digits: 3),
        description: Faker::Food.fruits,
        calories_action: Faker::Boolean.boolean,
        date: Faker::Date.between(from: 30.days.ago, to: Date.today),
        user_id: "2"
    )
end