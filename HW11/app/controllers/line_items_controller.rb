class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    if current_cart.line_items.find_by(product_id: product.id)
      item = current_cart.line_items.find_by(product_id: product.id)
      item.update(quantity: item.quantity += 1)
    else
      current_cart.add_product(product)
    end
    redirect_to cart_path, notice: "#{product.name} was successfully"
  end

  def destroy
    product = Product.find(params[:id])
    current_cart.line_items.find_by(product_id: product.id).destroy

    redirect_to cart_path, notice: "#{product.name} was delete successfully"
  end


  def add_quantity
    line_item = LineItem.find(params[:id])
    line_item.quantity += 1
    line_item.save

    redirect_to cart_path
  end

  def reduce_quantity
    line_item = LineItem.find(params[:id])
    if line_item.quantity > 1
      line_item.quantity -= 1
    end
    line_item.save

    redirect_to cart_path
  end
end
