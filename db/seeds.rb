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
user6 = User.create!(email: "user6@gmail.com", password: 'password123', password_confirmation: 'password123', address: '116 Kloof Street, Cape Town')
user7 = User.create!(email: "user7@gmail.com", password: 'password123', password_confirmation: 'password123', address: '62 Bree Street, Cape Town')
user8 = User.create!(email: "user8@gmail.com", password: 'password123', password_confirmation: 'password123', address: '42 Strand Street, Cape Town')
user9 = User.create!(email: "user9@gmail.com", password: 'password123', password_confirmation: 'password123', address: '3 Parade Street, Cape Town')
user10 = User.create!(email: "user10@gmail.com", password: 'password123', password_confirmation: 'password123', address: '3 Hof Street, Cape Town')
user11 = User.create!(email: "user11@gmail.com", password: 'password123', password_confirmation: 'password123', address: '1 Ludlow Road, Cape Town')
user12 = User.create!(email: "user12@gmail.com", password: 'password123', password_confirmation: 'password123', address: '10 Herbert Road, Cape Town')
user13 = User.create!(email: "user13@gmail.com", password: 'password123', password_confirmation: 'password123', address: '4 Trill Road, Cape Town')
user14 = User.create!(email: "user14@gmail.com", password: 'password123', password_confirmation: 'password123', address: '1 Avenue Alexandra, Cape Town')
user15 = User.create!(email: "user15@gmail.com", password: 'password123', password_confirmation: 'password123', address: '2 Breda Street, Cape Town')
user16 = User.create!(email: "user16@gmail.com", password: 'password123', password_confirmation: 'password123', address: '1 Molteno Road, Cape Town')
user17 = User.create!(email: "user17@gmail.com", password: 'password123', password_confirmation: 'password123', address: '112 Lower Main Road, Cape Town')
user18 = User.create!(email: "user18@gmail.com", password: 'password123', password_confirmation: 'password123', address: '1 Lower Main Road, Cape Town')
user19 = User.create!(email: "user19@gmail.com", password: 'password123', password_confirmation: 'password123')

puts "Succesfully generated #{User.count} users"

puts "Generating offers..."

fresh_smoothies = Offer.new(
  shop: "Smoothie Haven",
  title: "Fresh Smoothie Bundle",
  description: "A bundle of refreshing and nutritious smoothies made with fresh fruits and vegetables",
  quantity: 18,
  unit_price: 7.99,
  user: user1,
  pickup_instructions: "Collect your smoothie bundle at the smoothie counter",
  pickup_time_start: Time.parse("10:00 AM"),
  pickup_time_end: Time.parse("12:00 PM"),
  hotdeals: true
)

smoothie_url = "https://hips.hearstapps.com/hmg-prod/images/summer-smoothiess-1608647526.jpg?crop=1.00xw:0.992xh;0,0&resize=1200:*"
smoothie_file = URI.open(smoothie_url)
fresh_smoothies.photo.attach(io: smoothie_file, filename: 'smoothie_img.jpeg', content_type: 'image/png')
fresh_smoothies.save!


fresh_waffles = Offer.new(
  shop: "Waffle Wonderland",
  title: "Assorted Waffle Platter",
  description: "An assortment of freshly baked waffles with a variety of toppings",
  quantity: 10,
  unit_price: 11.49,
  user: user2,
  pickup_instructions: "Pick up your waffle platter at the waffle station",
  pickup_time_start: Time.parse("2:30 PM"),
  pickup_time_end: Time.parse("4:30 PM"),
  hotdeals: true
)

waffle_url = "https://foodhub.scene7.com/is/image/woolworthsltdprod/2204-waffle-breakfast-platter:Mobile-1300x1150"
waffle_file = URI.open(waffle_url)
fresh_waffles.photo.attach(io: waffle_file, filename: 'waffle_img.jpeg', content_type: 'image/png')
fresh_waffles.save!

starbucks = Offer.new(
  shop: "Starbucks",
  title: "Surprise bag",
  description: "Let's keep it a surprise ey? But trust me, you'll get only good stuff.",
  quantity: 10,
  unit_price: 4.99,
  user: user3,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("7:00 PM"),
  hotdeals: true
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
  user: user4,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM"),
  hotdeals: true
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
  user: user5,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("4:00 PM"),
  pickup_time_end: Time.parse("5:00 PM"),
  hotdeals: true
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
  user: user6,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("6:30 PM"),
  hotdeals: true
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
  user: user7,
  pickup_instructions: "Please pick up at counter at given time",
  pickup_time_start: Time.parse("6:00 PM"),
  pickup_time_end: Time.parse("7:30 PM"),
  hotdeals: true
)

veggie_url = "https://hips.hearstapps.com/hmg-prod/images/chicken-caesar-salad7-1654809005.jpg?crop=0.588xw:0.880xh;0.0497xw,0.120xh&resize=1200:*"
veggie_file = URI.open(veggie_url)
veggie.photo.attach(io: veggie_file, filename: 'veggie_img.jpeg', content_type: 'image/png')
veggie.save!

sushi_delight = Offer.new(
  shop: "Sushi Delight",
  title: "Sushi Roll Combo",
  description: "An assortment of classic and specialty sushi rolls",
  quantity: 15,
  unit_price: 13.99,
  user: user8,
  pickup_instructions: "Collect your sushi order at the sushi counter",
  pickup_time_start: Time.parse("6:00 PM"),
  pickup_time_end: Time.parse("8:00 PM"),
  hotdeals: false
)

sushi_delight_url = "https://tb-static.uber.com/prod/image-proc/processed_images/235bbf0959025412c402a23707b26155/3ac2b39ad528f8c8c5dc77c59abb683d.jpeg"
sushi_delight_file = URI.open(sushi_delight_url)
sushi_delight.photo.attach(io: sushi_delight_file, filename: 'sushi_delight_img.jpeg', content_type: 'image/png')
sushi_delight.save!

fresh_salads = Offer.new(
  shop: "Fresh Greens",
  title: "Healthy Salad Box",
  description: "A variety of fresh and healthy salads with homemade dressings",
  quantity: 12,
  unit_price: 6.99,
  user: user9,
  pickup_instructions: "Pick up your salad box near the entrance",
  pickup_time_start: Time.parse("11:30 AM"),
  pickup_time_end: Time.parse("1:30 PM"),
  hotdeals: false
)

salad_url = "https://www.bordbia.ie/globalassets/bordbia.ie/lifestyle/recipes/green-salad2.png?format=webp&quality=72&width=752"
salad_file = URI.open(salad_url)
fresh_salads.photo.attach(io: salad_file, filename: 'salad_img.jpeg', content_type: 'image/png')
fresh_salads.save!

artisan_bakery = Offer.new(
  shop: "Artisan Bakery",
  title: "Assorted Pastries Box",
  description: "Indulge in a box of artisanal pastries, freshly baked with love",
  quantity: 10,
  unit_price: 9.49,
  user: user10,
  pickup_instructions: "Pick up your pastries at the bakery counter",
  pickup_time_start: Time.parse("3:00 PM"),
  pickup_time_end: Time.parse("5:00 PM"),
  hotdeals: false
)

bakery_img_url = "https://cdnimg.webstaurantstore.com/uploads/blog/2018/8/start-a-bakery-bakery-display-case.jpg"
bakery_img_file = URI.open(bakery_img_url)
artisan_bakery.photo.attach(io: bakery_img_file, filename: 'artisan_bakery_img.jpeg', content_type: 'image/png')
artisan_bakery.save!

fresh_juices = Offer.new(
  shop: "Juice Junction",
  title: "Fresh Juice Pack",
  description: "A pack of refreshing and nutritious freshly squeezed juices",
  quantity: 20,
  unit_price: 5.99,
  user: user11,
  pickup_instructions: "Grab your juice pack at the juice bar",
  pickup_time_start: Time.parse("4:30 PM"),
  pickup_time_end: Time.parse("6:30 PM"),
  hotdeals: false
)

juice_url = "https://www.tasteofhome.com/wp-content/uploads/2019/06/juices-shutterstock_121270552.jpg"
juice_file = URI.open(juice_url)
fresh_juices.photo.attach(io: juice_file, filename: 'juice_img.jpeg', content_type: 'image/png')
fresh_juices.save!

sweet_treats = Offer.new(
  shop: "Sweet Treats Bakery",
  title: "Dessert Assortment Box",
  description: "A box filled with delightful desserts, perfect for satisfying your sweet tooth",
  quantity: 8,
  unit_price: 10.99,
  user: user12,
  pickup_instructions: "Pick up your dessert box at the bakery counter",
  pickup_time_start: Time.parse("2:00 PM"),
  pickup_time_end: Time.parse("4:00 PM"),
  hotdeals: false
)

dessert_url = "https://www.cheesecake.com.au/media/catalog/product/cache/1b5b6c4d9648c4ead645845bace8f811/_/2/_2596_20TCS_DessertBox_LG_angle_400x400.png"
dessert_file = URI.open(dessert_url)
sweet_treats.photo.attach(io: dessert_file, filename: 'dessert_img.jpeg', content_type: 'image/png')
sweet_treats.save!

healthy_bowls = Offer.new(
  shop: "Green Bowls",
  title: "Superfood Bowl Combo",
  description: "A combination of nutrient-packed superfood bowls with a variety of toppings",
  quantity: 15,
  unit_price: 11.99,
  user: user13,
  pickup_instructions: "Collect your superfood bowl combo near the entrance",
  pickup_time_start: Time.parse("12:30 PM"),
  pickup_time_end: Time.parse("2:30 PM"),
  hotdeals: false
)

bowl_url = "https://pinchofyum.com/wp-content/uploads/Mediterranean-Bowl-Recipe.jpg"
bowl_file = URI.open(bowl_url)
healthy_bowls.photo.attach(io: bowl_file, filename: 'bowl_img.jpeg', content_type: 'image/png')
healthy_bowls.save!

fruit_paradise = Offer.new(
  shop: "Fruit Paradise",
  title: "Exotic Fruit Basket",
  description: "A basket filled with a variety of exotic and fresh fruits",
  quantity: 12,
  unit_price: 8.49,
  user: user14,
  pickup_instructions: "Pick up your fruit basket at the fruit stand",
  pickup_time_start: Time.parse("3:30 PM"),
  pickup_time_end: Time.parse("5:30 PM"),
  hotdeals: false
)

fruit_url = "https://m.media-amazon.com/images/I/71cTw-FHs4L.jpg"
fruit_file = URI.open(fruit_url)
fruit_paradise.photo.attach(io: fruit_file, filename: 'fruit_img.jpeg', content_type: 'image/png')
fruit_paradise.save!

coffee_lovers = Offer.new(
  shop: "Bean Bliss",
  title: "Coffee Lover's Pack",
  description: "A curated pack for coffee enthusiasts, featuring a selection of premium Turkish coffee blends",
  quantity: 10,
  unit_price: 15.99,
  user: user15,
  pickup_instructions: "Grab your coffee pack at the coffee counter",
  pickup_time_start: Time.parse("7:30 AM"),
  pickup_time_end: Time.parse("9:00 AM"),
  hotdeals: false
)

coffee_url = "https://i.etsystatic.com/30522362/r/il/a22420/4064624246/il_570xN.4064624246_setw.jpg"
coffee_file = URI.open(coffee_url)
coffee_lovers.photo.attach(io: coffee_file, filename: 'coffee_img.jpeg', content_type: 'image/png')
coffee_lovers.save!


gourmet_pizzas = Offer.new(
  shop: "Pizza Elegante",
  title: "Gourmet Pizza Box",
  description: "A box of gourmet pizzas featuring a variety of unique and delicious toppings",
  quantity: 14,
  unit_price: 16.99,
  user: user16,
  pickup_instructions: "Pick up your gourmet pizza box near the entrance",
  pickup_time_start: Time.parse("5:00 PM"),
  pickup_time_end: Time.parse("7:00 PM"),
  hotdeals: false
)

pizza_url = "https://tastesbetterfromscratch.com/wp-content/uploads/2020/06/Grilled-Pizzas-4-1.jpg"
pizza_file = URI.open(pizza_url)
gourmet_pizzas.photo.attach(io: pizza_file, filename: 'pizza_img.jpeg', content_type: 'image/png')
gourmet_pizzas.save!


authentic_tacos = Offer.new(
  shop: "Taco Fiesta",
  title: "Authentic Taco Platter",
  description: "A platter of authentic tacos with traditional Mexican flavors",
  quantity: 20,
  unit_price: 9.99,
  user: user17,
  pickup_instructions: "Grab your authentic tacos at the taco stand",
  pickup_time_start: Time.parse("6:30 PM"),
  pickup_time_end: Time.parse("8:30 PM"),
  hotdeals: false
)

taco_authentic_url = "https://i2.wp.com/hipfoodiemom.com/wp-content/uploads/2021/05/Taco_Board_3340.jpg"
taco_authentic_file = URI.open(taco_authentic_url)
authentic_tacos.photo.attach(io: taco_authentic_file, filename: 'taco_authentic_img.jpeg', content_type: 'image/png')
authentic_tacos.save!


puts "Succesfully generated #{Offer.count} offers"
