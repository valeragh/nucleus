class AddSlugToPodCategories < ActiveRecord::Migration
  def change
    add_column :pod_categories, :slug, :string
    add_index :pod_categories, :slug, unique: true
  end
end
