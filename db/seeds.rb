# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Service.create(price: 250, desc: "Gourmet Breakfast")
Service.create(price: 400, desc: "Limo Transport")
Service.create(price: 200, desc: "Daily Cleaning")
Service.create(price: 700, desc: "Massage Therapy")
Service.create(price: 270, desc: "Personal Yoga")

