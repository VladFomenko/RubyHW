class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :price, presence: true
  validates :image, presence: true, length: { minimum: 2 }
end
