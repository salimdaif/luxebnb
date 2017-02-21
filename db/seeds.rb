# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'



10.times do
  flat = Flat.new(
    title: Faker::Lorem.sentence,
    desc: Faker::Lorem.paragraph,
    capacity: (1..8).to_a.sample,
    room_number: (1..5).to_a.sample,
    bed_number: (1..10).to_a.sample,
    bathroom_number: (1..4).to_a.sample,
    price_night: (100..500).to_a.sample,
    city: ["rio", "barcelona", "paris", "sao paulo"].sample,
    address: Faker::Address.street_address,
    user_id: 3
  )
  flat.save!
  availablity = Availability.new(
    start_date: Faker::Date.backward(23),
    end_time: Faker::Date.forward(23),
    available: true,
    flat_id: flat.id
    )
  availablity.save!
end
