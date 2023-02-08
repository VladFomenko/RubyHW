class LineItemsController < ApplicationController
  # before_action :define_quantity_items_in_cart
  before_action :set_line_item, only: %i[create change_quantity destroy]
  before_action :set_product, only: %i[create]

  def create
    define_quantity_items_in_cart
    if @line_item.present?
      @line_item.update(quantity: item.quantity += 1)
    else
      current_cart.add_product(@product)
    end
    render partial: 'shared/quantity', notice: "#{@product.name} was successfully"
    # redirect_to products_path, notice: "#{@product.name} was successfully"
  end

  def destroy
    @line_item.destroy

    redirect_to cart_path, notice: "#{@line_item.product.name} was delete successfully"
  end

  def change_quantity
    define_operation(params['act'])

    render partial: 'shared/quantity'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_line_item
    @line_item = current_cart.line_items.find_by(product_id: params[:id])
  end

  def define_operation(act)
    if act == 'add'
      @line_item.update(quantity: @line_item.quantity + 1)
    elsif @line_item.quantity > 1
      @line_item.update(quantity: @line_item.quantity - 1)
    end
  end
end
