# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

fakeemail = ["tanguy@yopmail.com", "jojo@yopmail.com", "gérard@yopmail.com", "adrien@yopmail.com", "lucie@yopmail.com"]

5.times do
  User.create(email: fakeemail.sample, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: '123456', description: Faker::GreekPhilosophers.quote)
end
puts "Users created! "


10.times do
  Event.create(user_id: User.all.sample.id, start_date: Date.today + rand(10_000), duration: rand(60..242), title: Faker::Superhero.descriptor, price: rand(1..1000), location: Faker::Movies::HarryPotter.location, description: Faker::GreekPhilosophers.quote)
end
puts "Events Created! "


6.times do
  Attendance.create(user_id: User.all.sample.id, event_id: Event.all.sample.id, stripe_customer_id: Faker::Bank.iban)
end
puts "Attendances Created! "