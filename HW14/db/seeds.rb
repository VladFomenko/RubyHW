# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'ffaker'

AdminUser.delete_all
User.delete_all
Product.delete_all
Category.delete_all
Cart.delete_all
Order.delete_all

AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create({ email: 'test@gmail.com', password: 'password', password_confirmation: 'password' })
10.times { User.create({ email: FFaker::Internet.safe_email, password: 'password', password_confirmation: 'password' }) }

Category.create(title: 'food')
Category.create(title: 'drink')

names_of_food = %w[Bread Chicken Beef Turkey Duck Pork Lamb]
images_of_food = %w[
                    https://pics.clipartpng.com/Bread_PNG_Clip_Art-2218.png
                    https://previews.123rf.com/images/galamik/galamik1203/galamik120300046/12758725-glass-of-cranberry-juice-on-a-white-background.jpg
                    https://e7.pngegg.com/pngimages/892/519/png-clipart-omaha-beefsteak-rib-eye-steak-meat-steak-food-beef.png
                    https://simshomekitchen.com/wp-content/uploads/2020/12/christmas-turkey-on-a-plate-683x1024.jpg
                    https://pesto-family.com/image/cache/catalog/pestocafe/506c3135bc734fb4acf6de2af00ec1ea_1608205019-770x480.png
                    https://www.pngall.com/wp-content/uploads/3/Pork-PNG-Clipart.png
                    http://cdn.goodhouse.com.ua/images-jpg/12632/126320.jpg
                    ]

food_category = Category.find_by(title: 'food')

names_of_drinks = ['bottle of water', 'orange juice', 'beet juice', 'apple juice', 'prune juice', 'cranberry juice']
images_of_drinks = %w[
                      https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZOSDemY8E94X08gNdO-vjkYh5mwrqFbqtfA&usqp=CAU
                      https://upload.wikimedia.org/wikipedia/commons/0/05/Orangejuice.jpg
                      https://cdn.w2w.com.ua/wp-content/uploads/2019/05/1e315e86c16afeb856af16475f2b2dac.jpg
                      https://images.onlymyhealth.com/imported/images/2022/November/19_Nov_2022/main-applejuicebenefits.jpg
                      https://img.livestrong.com/630x/cme-data/getty%2F31de020af4504b81ad3fca5fe2a938b4.jpg?type=webp
                      https://previews.123rf.com/images/galamik/galamik1203/galamik120300046/12758725-glass-of-cranberry-juice-on-a-white-background.jpg
                      ]
drinks_category = Category.find_by(title: 'drink')

names_of_food.each.with_index do |food, i|
  product = Product.new(name: food, description: "This is #{food.downcase}", price: rand(10.0..20.0).round(2), category_id: food_category.id)
  img = URI.open(images_of_food[i])
  product.image.attach(io: img, filename: "#{product.name}.jpg")
  product.save
end

names_of_drinks.each.with_index do |food, i|
  product = Product.create(name: food, description: "This is #{food.downcase}", price: rand(10.0..20.0).round(2), category_id: drinks_category.id)
  img = URI.open(images_of_drinks[i])
  product.image.attach(io: img, filename: "#{product.name}.jpg")
  product.save
end


product = Product.all
5.times do
  cart = Cart.create
  current_product = product.sample
  10.times { LineItem.create(product_id: current_product, cart_id: cart, quantity: rand(1..3), price: current_product.price) }
  cart.save
end

cart = Cart.all
user = User.all

100.times { Order.create(cart_id: cart.sample.id, user_id: user.sample.id, status: 1, created_at: Date.new(2023, 1, rand(1..31))) }
