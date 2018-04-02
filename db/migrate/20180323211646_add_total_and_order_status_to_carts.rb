class AddTotalAndOrderStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :total, :decimal,  precision: 12, scale: 3
    add_column :carts, :order_status_id, :integer, index: true
  end
end
