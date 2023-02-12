# == Schema Information
#
# Table name: line_items
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  cart_id    :bigint           not null
#  quantity   :integer          default(1)
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart, optional: true

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  scope :all_product_with_cart, ->(cart_id) { includes([:product]).where('cart_id = ?', cart_id) }

  # after_create_commit -> { broadcast_replace_to 'cart-total_items', partial: 'carts/total_items', locals: { total: total_quantity }, target: 'cart-total_items' }
  # after_update_commit -> { broadcast_replace_to 'cart-total', partial: 'carts/total', locals: { total: total_line_item_quantity }, target: 'cart-total' }

  def total_price
    quantity * price
  end

  def total_quantity
    quantity
  end

  def total_line_item_quantity
    self.cart.line_items.includes(:product).sum(&:quantity)
  end
end
