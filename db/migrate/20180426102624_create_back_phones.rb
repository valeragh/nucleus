class CreateBackPhones < ActiveRecord::Migration
  def change
    create_table :back_phones do |t|
      t.string :name
      t.string :phone
      t.datetime :checked_out_at

      t.timestamps null: false
    end
  end
end
