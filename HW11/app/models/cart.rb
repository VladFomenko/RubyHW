class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify

  def add_product(product)
    line_items.create(product: product)
  end
end
