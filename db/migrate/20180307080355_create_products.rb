class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :rang
      t.integer :pod_category_id
      t.integer :category_id
      t.string :status, default: "В наличие"

      t.timestamps null: false
    end
  end
end
