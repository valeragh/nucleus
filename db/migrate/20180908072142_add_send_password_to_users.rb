class AddSendPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :send_password, :boolean
  end
end
