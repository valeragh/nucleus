class CreatePodCategories < ActiveRecord::Migration
  def change
    create_table :pod_categories do |t|
      t.string :title
      t.string :image_url
      t.integer :rang
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
