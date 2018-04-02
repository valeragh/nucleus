class AddPhoneAndDescriptionToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :phone, :string
    add_column :orders, :description, :text
  end
end
