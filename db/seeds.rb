# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'
Participation.destroy_all
Participation.reset_pk_sequence

Event.destroy_all
Event.reset_pk_sequence

User.destroy_all
User.reset_pk_sequence


10.times do |i|
user = User.create(first_name: Faker::Name.first_name,
                  last_name:Faker::Name.first_name,
                  description: Faker::Lorem.paragraph(sentence_count: 3),
                  email: Faker::Internet.email)
end


event = Event.create(start_date:'12/04/2021',
                  duration:6000,
                  title:"titre",
                  description:"papozekafpokpoeak czepoekcpkze czemlokck",
                  price: 15,
                  location: "Dijon",
                  administrator_id: 1)

Participation.create(event_id:1, participant_id: 6, stripe_customer_id: "hello")
Participation.create(event_id:1, participant_id: 4, stripe_customer_id: "hello")
Participation.create(event_id:1, participant_id: 7, stripe_customer_id: "hello")

puts " Seed done !"