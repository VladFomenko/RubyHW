class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(category_id: params[:category]) if params[:category].present?
  end

  def show
    @product = Product.find(params[:id])
  end
end
