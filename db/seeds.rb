# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'
require 'open-uri'

puts "Resetting the database..."

User.destroy_all
Offer.destroy_all
Order.destroy_all

puts "Database resetted"

puts "Generating users..."

user1 = User.create!(email: "user1@gmail.com", password: 'password123', password_confirmation: 'password123', address: '97 Durham Avenue, Cape Town')
user2 = User.create!(email: "user2@gmail.com", password: 'password123', password_confirmation: 'password123', address: '116 Loop Street, Cape Town')
user3 = User.create!(email: "user3@gmail.com", password: 'password123', password_confirmation: 'password123', address: '34 Wale Street, Cape Town')
user4 = User.create!(email: "user4@gmail.com", password: 'password123', password_confirmation: 'password123', address: '3 Park Road, Cape Town')
user5 = User.create!(email: "user5@gmail.com", password: 'password123', password_confirmation: 'password123', address: '1 Kloof Street, Cape Town')

puts "Succesfully generated #{User.count} users"

puts "Generating offers..."

starbucks = Offer.new(
  shop: "Starbucks",
  title: "Surprise bag",
  description: "Let's keep it a surprise ey? But trust me, you'll get only good stuff.",
  quantity: 10,
  unit_price: 4.99,
  user: user1,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("7:00 PM")
)

starbucks_url = "https://tb-static.uber.com/prod/image-proc/processed_images/cb7ff9b7adeaee690bff94efc220c343/16bb0a3ab8ea98cfe8906135767f7bf4.jpeg"
starbucks_file = URI.open(starbucks_url)
starbucks.photo.attach(io: starbucks_file, filename: 'starbucks_img.jpeg', content_type: 'image/png')
starbucks.save!

dunkin_donuts = Offer.new(
  shop: "Dunkin' Donuts",
  title: "Huge box of donuts",
  description: "A box of 12 different donuts - expect different flavors, and maximum pleasure",
  quantity: 15,
  unit_price: 5.99,
  user: user2,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM")
)

dunkin_donuts_url = "https://hungryforhalaal.co.za/wp-content/uploads/2016/10/Dunkin-Donuts-Hungry-for-halaal-14.jpg"
dunkin_donuts_file = URI.open(dunkin_donuts_url)
dunkin_donuts.photo.attach(io: dunkin_donuts_file, filename: 'dunkin_donuts_img.jpeg', content_type: 'image/png')
dunkin_donuts.save!

baker = Offer.new(
  shop: "Le boulanger fraçais",
  title: "Mistery box",
  description: "A variety of delicious french pastries",
  quantity: 8,
  unit_price: 7.99,
  user: user3,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM")
)

bakery_url = "https://www.snackandbakery.com/ext/resources/images/bakeryproducts.jpg?1432238179"
bakery_file = URI.open(bakery_url)
baker.photo.attach(io: bakery_file, filename: 'bakery_img.jpeg', content_type: 'image/png')
baker.save!

gatsu = Offer.new(
  shop: "Gatsu Gatsu",
  title: "Poke bowl",
  description: "A medium-sized poke bowl - might be tuna, salmon or chicken",
  quantity: 20,
  unit_price: 7.99,
  user: user4,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("6:30 PM")
)

gatsu_url = "https://images.themodernproper.com/billowy-turkey/production/posts/2021/Poke-Bowl-11.jpeg?w=960&h=960&q=82&fm=jpg&fit=crop&dm=1644553103&s=e3d80debf17159866b52147db4167ef7"
gatsu_file = URI.open(gatsu_url)
gatsu.photo.attach(io: gatsu_file, filename: 'gatsu_img.jpeg', content_type: 'image/png')
gatsu.save!

veggie = Offer.new(
  shop: "Veggie Deluxe",
  title: "Homemade ceasar salad",
  description: "Delicious caesar salad with chicken, croutons and homemade dressing",
  quantity: 12,
  unit_price: 3.99,
  user: user5,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("6:00 PM"),
  pickup_time_end: Time.parse("7:30 PM")
)

veggie_url = "https://hips.hearstapps.com/hmg-prod/images/chicken-caesar-salad7-1654809005.jpg?crop=0.588xw:0.880xh;0.0497xw,0.120xh&resize=1200:*"
veggie_file = URI.open(veggie_url)
veggie.photo.attach(io: veggie_file, filename: 'veggie_img.jpeg', content_type: 'image/png')
veggie.save!

puts "Succesfully generated #{Offer.count} offers"
