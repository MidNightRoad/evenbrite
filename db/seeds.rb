# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do 
user = User.create(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   description: Faker::Lorem.sentence(word_count: 15),
   email: ["user1@yopmail.fr","user2@yopmail.fr","user3@yopmail.fr"].sample)
end