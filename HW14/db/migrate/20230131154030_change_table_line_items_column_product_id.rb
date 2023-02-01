class ChangeTableLineItemsColumnProductId < ActiveRecord::Migration[7.0]
  def change
    change_column :line_items, :product_id, :bigint, null: :true
  end
end
