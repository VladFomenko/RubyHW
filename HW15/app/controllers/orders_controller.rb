class OrdersController < ApplicationController
  before_action :define_quantity_items_in_cart

  def index
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create(cart: current_cart)
    cookies.delete(:cart_id)

    redirect_to order_path(order), notice: "create order number ##{order.id}"
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def paid
    order = Order.find(params[:id])
    order.status = 'paid'
    order.save

    UserMailer.order_completed_email(current_user, order).deliver_now

    redirect_to order_path(order), notice: "updated ##{order.id}"
  end
end
