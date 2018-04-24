class AddIdentifToProducts < ActiveRecord::Migration
  def change
    add_column :products, :identif, :integer
  end
end
