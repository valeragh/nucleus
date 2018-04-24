class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :price_url
      t.string :data_url

      t.timestamps null: false
    end
  end
end
