class ProductsController < ApplicationController
  before_action :check_user_signed
  before_action :set_product, only: :show
  def index
    @products = Product.all.with_attached_image
    @products = @products.where(category_id: params[:category]).with_attached_image if params[:category].present?
  end

  def show
    @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
