# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Resetting the database..."

User.destroy_all
Offer.destroy_all
Order.destroy_all

puts "Database resetted"

sleep(0.2)

puts "Generating users..."

5.times do |i|
  User.create!(email: "user#{i + 1}@gmail.com", password: 'password123', password_confirmation: 'password123')
end

puts "Succesfully generated #{User.all.length} users"

sleep(0.2)

puts "Generating offers..."

Offer.create!(
  shop: "Starbucks",
  title: "Surprise bag",
  description: "Let's keep it a surprise ey? But trust me, you'll get only good stuff.",
  quantity: 10,
  unit_price: 4.99,
  user_id: User.first.id,
  picture: "../app/assets/images/starbucks.jpeg",
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("7:00 PM")
)

Offer.create!(
  shop: "Dunkin' Donuts",
  title: "Huge box of donuts",
  description: "A box of 12 different donuts - expect different flavors, and maximum pleasure",
  quantity: 15,
  unit_price: 5.99,
  user_id: 2,
  picture: "../app/assets/images/donuts.jpeg",
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM")
)

Offer.create!(
  shop: "Le boulanger fraçais",
  title: "Mistery box",
  description: "A variety of delicious french pastries",
  quantity: 8,
  unit_price: 7.99,
  user_id: 3,
  picture: "../app/assets/images/donuts.jpeg",
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM")
)

Offer.create!(
  shop: "Gatsu Gatsu",
  title: "Poke bowl",
  description: "A medium-sized poke bowl - might be tuna, salmon or chicken",
  quantity: 20,
  unit_price: 7.99,
  user_id: 4,
  picture: "../app/assets/images/poke-bowl.jpeg",
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("6:30 PM")
)

Offer.create!(
  shop: "Veggie Deluxe",
  title: "Homemade ceasar salad",
  description: "Delicious caesar salad with chicken, croutons and homemade dressing",
  quantity: 12,
  unit_price: 3.99,
  user_id: 4,
  picture: "../app/assets/images/ceasar_salad.jpeg",
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("6:00 PM"),
  pickup_time_end: Time.parse("7:30 PM")
)

puts "Succesfully generated #{Offer.all.length} offers"

sleep(0.2)
