# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order, dependent: :destroy

  # after_commit -> { broadcast_replace_to 'carts', partial: 'cart/total_items', locals: { total: define_quantity_items_in_cart }, target: 'cart-total_items' }
  # after_commit -> { broadcast_replace_to 'cart-total', partial: 'carts/total', locals: { total: line_items_quantity }, target: 'cart-total' }


  def add_product(product)
    line_items.create(product: product, price: product.price)
  end

  def total_quantity
    line_items.sum(&:total_quantity)
  end

  def total_price
    line_items.sum(&:total_price)
  end
end
