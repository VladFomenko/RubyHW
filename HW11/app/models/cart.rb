class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify

  def add_product(product)
    line_items.create(product: product, price: product.price)
  end

  def total_price
    line_items.inject(0) { |sum, e| sum + e.quantity * e.price }
  end
end
