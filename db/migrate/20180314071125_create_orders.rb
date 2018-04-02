class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_status_id
      t.integer :user_id
      t.decimal :total,        precision: 12, scale: 3
      t.string :delivery
      t.references :order_status, index: true

      t.timestamps null: false
    end
  end
end
