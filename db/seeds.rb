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
Booking.destroy_all

# creating an empty array for the indices of the flats in db and setting up counter
flats_index_array = []
counter=0

puts 'creating 20 flats'
5.times do
  url = 'https://source.unsplash.com/collection/1134892'
  flat = Flat.create(title: Faker::TvShows::Simpsons.location, address: Faker::Address.full_address, city: Faker::Address.city, price_night: rand(100..5000), description: Faker::Restaurant.description, id_user: rand(1..10), remote_picture_url: url)
  p flat.title + " created! :)"
end

5.times do
  url = 'https://source.unsplash.com/collection/1134892'
  flat = Flat.create(title: Faker::TvShows::Simpsons.location, address: Faker::Address.full_address, city: "Barcelona", price_night: rand(100..5000), description: Faker::Restaurant.description, id_user: rand(1..10), remote_picture_url: url)
  p flat.title + " created! :)"
end

5.times do
  url = 'https://source.unsplash.com/collection/1134892'
  flat = Flat.create(title: Faker::TvShows::Simpsons.location, address: Faker::Address.full_address, city: "Madrid", price_night: rand(100..5000), description: Faker::Restaurant.description, id_user: rand(1..10), remote_picture_url: url)
  p flat.title + " created! :)"
end

5.times do
  url = 'https://source.unsplash.com/collection/1134892'
  flat = Flat.create(title: Faker::TvShows::Simpsons.location, address: Faker::Address.full_address, city: "Paris", price_night: rand(100..5000), description: Faker::Restaurant.description, id_user: rand(1..10), remote_picture_url: url)
  p flat.title + " created! :)"
end

puts 'seeding the empty array with the indices'
Flat.all.each do |flat|
  flats_index_array<< flat.id
end

20.times do
  booking = Booking.new(start_date: Date.strptime('03-06-2019', '%d-%m-%Y'), end_date: Date.strptime('03-07-2019', '%d-%m-%Y'))
  booking.id_flat = flats_index_array[counter]
  counter += 1
  booking.save
end




puts "Done!"

