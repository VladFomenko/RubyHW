class ProductsController < ApplicationController
  def index
    UserWinnerWorker.set(wait: 1.month).perform_async
    @products = Product.all.with_attached_image
    @products = @products.where(category_id: params[:category]).with_attached_image if params[:category].present?
  end

  def show
    @product = Product.find(params[:id])
  end
end
