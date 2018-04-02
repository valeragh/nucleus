class AddIndexToOrderItems < ActiveRecord::Migration
  def change
  	add_index :order_items, :cart_id
  	add_index :carts, :order_status_id
  end
end
