class LineItemsController < ApplicationController
  before_action :define_quantity_items_in_cart
  before_action :set_line_item, only: %i[create update destroy]
  before_action :set_product, only: %i[create]

  def create
    if @line_item.present?
      @line_item.update(quantity: @line_item.quantity += 1)
    else
      current_cart.add_product(@product)
      @line_item = current_cart.line_items.find_by(product_id: @product.id)
    end


    respond_to do |format|
      # format.html { render partial: 'line_items/quantity', notice: "#{@product.name} was successfully." }
      format.html { redirect_to line_item_path(@line_item) }
      format.turbo_stream
    end
    # render partial: 'line_items/quantity', notice: "#{@product.name} was successfully."
  end

  def show; end

  def update
    # debugger
    change_quantity

    respond_to do |format|
      format.html { redirect_to line_item_path(@line_item) }
      format.turbo_stream
    end
  end

  def destroy
    @line_item.destroy

    # respond_to do |format|
    #   format.html { redirect_to cart_path, notice: "#{@line_item.product.name} was delete successfully." }
    #   format.turbo_stream { render turbo_stream: turbo_stream.remove(@line_item) }
    # end
    redirect_to cart_path, notice: "#{@line_item.product.name} was delete successfully."
  end


  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_line_item
    @line_item = current_cart.line_items.find_by(id: params[:id])
  end

  def change_quantity
    define_operation(params['act'])

    # respond_to do |format|
    #   format.html { redirect_to line_item_path(@line_item) }
    #   format.turbo_stream
    # end
    # render partial: 'line_items/quantity'
  end

  def define_operation(act)
    if act == 'add'
      @line_item.update(quantity: @line_item.quantity + 1)
    elsif @line_item.quantity > 1
      @line_item.update(quantity: @line_item.quantity - 1)
    end
  end
end
