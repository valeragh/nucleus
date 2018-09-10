class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :status, default: "Показать"

      t.timestamps null: false
    end
  end
end
