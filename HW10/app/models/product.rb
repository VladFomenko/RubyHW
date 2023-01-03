class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true, length: { minimum: 2 }
end
