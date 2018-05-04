class AddDataAndPaymentStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :data, :text
    add_column :orders, :payment_status, :string, default: "Неоплаченный"
  end
end
