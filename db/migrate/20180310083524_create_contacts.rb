class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :description
      t.string :phone_one
      t.string :phone_two
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :status, default: "Показать"

      t.timestamps null: false
    end
  end
end
