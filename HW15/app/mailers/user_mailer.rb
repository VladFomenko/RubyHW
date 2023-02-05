class UserMailer < ApplicationMailer
  def order_completed_email(user, order)
    @user_order = order
    arr_id_products = Cart.find(@user_order.cart_id).line_items.map(&:product_id).uniq
    arr_id_products.each_with_index.map { |e, i| attachments.inline["photo#{i + 1}.png"] = Product.find(e).image.variant(:medium).download }
    mail(to: user.email, subject: 'Your order paid')
  end
end
