class ApplicationController < ActionController::Base
  helper_method :current_cart, :define_quantity_items_in_cart, :check_user_signed
  def initialize
    super
    @all_categories = Category.all
    @number_of_items_in_the_cart = 0
    @user_signed
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

  def check_user_signed
    @user_signed = user_signed_in?
  end
end
