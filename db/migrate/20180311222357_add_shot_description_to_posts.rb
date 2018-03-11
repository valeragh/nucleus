class AddShotDescriptionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :shot_description, :string
  end
end
