# frozen_string_literal: true

class UserWinners
  def self.call
    Order.where(status: 'paid', created_at: ((Date.today - 31)..(Date.today)))
         .uniq.sample(2)
         .map { |order| User.find(order.user_id) }
  end
end
