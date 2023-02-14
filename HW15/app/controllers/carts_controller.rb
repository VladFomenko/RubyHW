class CartsController < ApplicationController
  before_action :define_quantity_items_in_cart
  # before_action :set_product, only: :show
  def show; end

  private

  # def set_product
  #   @product = Product.find(params[:product_id])
  # end
end
