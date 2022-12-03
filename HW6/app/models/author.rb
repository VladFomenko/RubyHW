# frozen_string_literal: true

# class Author
class Author < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end
