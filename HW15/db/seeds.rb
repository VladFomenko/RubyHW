# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'ffaker'

AdminUser.destroy_all
User.destroy_all
Cart.destroy_all
Product.destroy_all
Category.destroy_all

AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create({ email: 'test@gmail.com', password: 'password', password_confirmation: 'password' })
10.times { User.create({ email: FFaker::Internet.safe_email, password: 'password', password_confirmation: 'password' }) }

Category.create(title: 'food')
Category.create(title: 'drink')

names_of_food = %w[Bread Chicken Beef Turkey Duck Pork Lamb]
images_of_food = %w[
  app/assets/images/food/Bread.png
  app/assets/images/food/Chicken.png
  app/assets/images/food/Beef.png
  app/assets/images/food/Turkey.png
  app/assets/images/food/Duck.png
  app/assets/images/food/Pork.png
  app/assets/images/food/Lamb.png
]

food_category = Category.find_by(title: 'food')

names_of_drinks = ['bottle of water', 'orange juice', 'beet juice', 'apple juice', 'prune juice', 'cranberry juice']
images_of_drinks = %w[
  app/assets/images/drinks/Water.png
  app/assets/images/drinks/Orange_juice.png
  app/assets/images/drinks/Beet_Juice.png
  app/assets/images/drinks/Apple_juice.png
  app/assets/images/drinks/Prune_juice.png
  app/assets/images/drinks/Cranberry_juice.png
]
drinks_category = Category.find_by(title: 'drink')

names_of_food.each.with_index do |food, i|
  product = Product.new(name: food, description: "This is #{food.downcase}", price: rand(10.0..20.0).round(2), category_id: food_category.id)
  product.image.attach(io: File.open(Rails.root.join(images_of_food[i])), filename: "#{product.name}.png")
  product.save
end

names_of_drinks.each.with_index do |food, i|
  product = Product.create(name: food, description: "This is #{food.downcase}", price: rand(10.0..20.0).round(2), category_id: drinks_category.id)
  product.image.attach(io: File.open(Rails.root.join(images_of_drinks[i])), filename: "#{product.name}.png")
  product.save
end

product = Product.all
user = User.all
100.times do
  cart = Cart.create
  10.times do
    current_product = product.sample
    check_line_item = cart.line_items.find_by(product_id: current_product.id)
    check_line_item.update(quantity: check_line_item.quantity += 1) if check_line_item.present?
    LineItem.create(product_id: current_product.id, cart_id: cart.id, quantity: rand(1..3), price: current_product.price)
  end
  cart.save
  Order.create(cart_id: cart.id, user_id: user.sample.id, status: 'paid', created_at: Date.new(2023, 1, rand(1..31)))
end
