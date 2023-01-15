# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# AdminUser.delete_all
# User.delete_all
# Category.delete_all
# Product.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# User.create!({:email => "test@gmail.com", :password => "password", :password_confirmation => "password" })

# Category.create(title: 'food')
# Category.create(title: 'drink')
#
# types_of_food = %w[Bread Chicken Beef Turkey Duck Pork Lamb]
# types_of_drinks = ['bottle of water', 'orange juice', 'beet juice', 'apple juice', 'prune juice', 'cranberry juice']
