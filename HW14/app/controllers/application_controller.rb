class ApplicationController < ActionController::Base
  helper_method :current_cart
  def initialize
    super
    @all_categories = Category.all
  end

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end
end
