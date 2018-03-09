class Review < ActiveRecord::Base
	belongs_to :product
	validates :name, :description, :product_id, :status, presence: true
end
