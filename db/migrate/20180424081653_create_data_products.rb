class CreateDataProducts < ActiveRecord::Migration
  def change
    create_table :data_products do |t|
      t.string :file_url

      t.timestamps null: false
    end
  end
end
