class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :description
      t.integer :product_id
      t.string :status, default: "Скрыть"

      t.timestamps null: false
    end
  end
end
