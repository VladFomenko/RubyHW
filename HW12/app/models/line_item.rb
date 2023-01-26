class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }


  scope :all_product_with_cart, ->(cart_id) { includes([:product]).where('cart_id = ?', cart_id) }
end
