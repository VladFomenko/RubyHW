class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  # def self.generalization_items
  #   ids_items = self.all.map(&:product_id).group_by{ |x| x }.values.sort
  #   uniq_items = self.uniq
  #
  # end
end
