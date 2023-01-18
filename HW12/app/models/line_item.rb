class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
