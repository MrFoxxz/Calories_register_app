# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |user|
    email = "usuario#{user+1}@mail.com"
    password = '123456'

    User.create!(
        email: email,
        password: password, 
        password_confirmation: password
    )

    100.times do |regis|
        if rand(1..2) == 1
            calories_action = 'Perdí Calorías'
        else
            calories_action = 'Gane Calorías'
        end
        calories = rand(100..1000)

        CaloriesRegister.create!(
            calories_action: calories_action,
            description: Faker::Food.fruits,
            date: Faker::Date.between(from: 30.days.ago, to: Date.today),
            user_id: User.last.id, 
            calories: calories 
        )
    end
end
