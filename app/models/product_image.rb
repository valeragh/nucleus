class ProductImage < ActiveRecord::Base
	belongs_to :image
	belongs_to :product

	validates :image_id, :product_id, presence: true
end
