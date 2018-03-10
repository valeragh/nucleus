class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name
      t.text :description
      t.string :email
      t.datetime :checked_out_at
      t.string :status, default: "Новое"

      t.timestamps null: false
    end
  end
end
