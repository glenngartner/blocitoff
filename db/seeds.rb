# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create my admin user account
require 'faker'

user_admin = User.create!(email:"glenngartner@gmail.com", password:"password")
    i = 1
5.times do 
    user_admin.items.create!(name: "Item #{i}")
    i += 1
end

# Create other users
5.times do
  User.create!(

    email: Faker::Internet.email,
    password: Faker::Internet.password
 )
end
users = User.all

10.times do
    Item.create!(
        user: users.sample,
        name: Faker::Hipster.sentence(3),
 )
end

 puts "Planted all the seeds"
 puts "#{User.count} users created"
 puts "#{Item.count} items created"