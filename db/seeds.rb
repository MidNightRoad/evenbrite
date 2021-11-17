# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
   User.create(
     first_name:Faker::Name.first_name,
     last_name:Faker::Name.last_name,
     description:Faker::Lorem.paragraph,
     password: Faker::Internet.password,
     email: ["user1@yopmail.com", "user2@yopmail.com", "user3@yopmail.com", "user4@yopmail.com", "user5@yopmail.com", "user6@yopmail.com", "user7@yopmail.com", "user8@yopmail.com","user9@yopmail.com", "user10@yopmail.com"  ].sample)
   
   end
   
   10.times do
     Evenement.create(
     start_date:Faker::Time.forward(days: 5,  period: :evening, format: :long),
     duration:Faker::Number.between(from:5,to:5),
     title:Faker::Kpop.ii_groups,
     description:Faker::Lorem.paragraph,
     price: Faker::Number.between(from: 1, to: 1000),
     location: ["Poitier", "Toulouse", 'Paris', 'Bordeaux', "Marseille"].sample,
     admin_id:User.all.sample.id
     )
   end
   
   20.times do
     Attendance.create(
     user_id: User.all.sample.id,
     evenement_id: Evenement.all.sample.id)
   end