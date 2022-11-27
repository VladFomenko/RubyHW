# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.all.each { |e| e.destroy  }

user_first = Author.create
user_second = Author.create
user_third = Author.create
@user = [user_first, user_second, user_third]

10.times do
  new_user = @user.shuffle
  new_user[0].articles.create(title: FFaker::Book.author, body: FFaker::Book.title)
  end
20.times do
  new_user = @user.shuffle
  new_user[0].comments.create(body: FFaker::ColorUA.name, article_id: Article.all.shuffle.first.id)
  end
