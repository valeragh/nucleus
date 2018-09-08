# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#  product_id :integer
#

class ProductImage < ActiveRecord::Base
	belongs_to :image
	belongs_to :product

	validates :image_id, :product_id, presence: true
end
