class DeleteDataUrlToPrices < ActiveRecord::Migration
  def change
  	remove_column :prices, :data_url
  end
end
