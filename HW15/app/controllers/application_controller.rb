class ApplicationController < ActionController::Base
  helper_method :current_cart, :define_quantity_items_in_cart
  def initialize
    super
    @all_categories = Category.all
    @number_of_items_in_the_cart = 0
  end

  UserWinnerWorker.set(wait: 1.month).perform_async

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end

  def define_quantity_items_in_cart
    cart = Cart.find_by(id: cookies[:cart_id])
    cart.nil? ? @number_of_items_in_the_cart = 0 : (@number_of_items_in_the_cart = cart.line_items.map(&:quantity).sum)
  end
end
