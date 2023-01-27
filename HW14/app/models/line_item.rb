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
  belongs_to :product
  belongs_to :cart, optional: true

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  scope :all_product_with_cart, ->(cart_id) { includes([:product]).where('cart_id = ?', cart_id) }
end
