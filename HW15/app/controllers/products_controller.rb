class ProductsController < ApplicationController
  before_action :define_quantity_items_in_cart
  def index
    @products = Product.all.with_attached_image
    @products = @products.where(category_id: params[:category]).with_attached_image if params[:category].present?
  end

  def show
    @product = Product.find(params[:id])
  end
end
