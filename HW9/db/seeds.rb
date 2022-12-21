# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.all.each(&:destroy)

user_first = Author.create(name: FFaker::NameUA.first_name)
user_second = Author.create(name: FFaker::NameUA.first_name)
user_third = Author.create(name: FFaker::NameUA.first_name)
@user = [user_first, user_second, user_third]

30.times do
  new_user = @user.shuffle
  new_user[0].articles.create(title: FFaker::Book.author, body: FFaker::Book.title, status: rand(0..1))
end

60.times do
  new_user = @user.shuffle
  new_user[0].comments.create(body: FFaker::ColorUA.name, article_id: Article.all.sample.id, status: rand(0..1))
end

40.times do
  Article.all.sample.tags.create(title: FFaker::Tweet.tags.split(' ').to_a.pop)
end
