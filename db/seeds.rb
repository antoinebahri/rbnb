# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "clearing up DB"
Flat.destroy_all

20.times do
  url = 'https://source.unsplash.com/random/400x207/?house,flat'
  flat = Flat.create(title: Faker::TvShows::Simpsons.location, address: Faker::Address.full_address, city: Faker::Address.city, price_night: rand(100..5000), description: Faker::Restaurant.description, id_user: rand(1..10), remote_picture_url: url)
  p flat.title + " created! :)"
end

puts "Done!"


