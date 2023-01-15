class Category < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :title, presence: true, length: { minimum: 2 }
end
