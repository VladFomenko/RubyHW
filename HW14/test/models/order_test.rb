# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  user_id    :bigint           not null
#  status     :string           default("unpaid")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
