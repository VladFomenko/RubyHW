# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )      default(0.0)
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  has_one_attached :image, dependent: :destroy do |attachable|
    attachable.variant :small, resize_to_limit: [255, 255]
    attachable.variant :medium, resize_to_limit: [500, 500]
  end

  after_create_commit -> { broadcast_prepend_to 'products' }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
