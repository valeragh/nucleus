class Image < ActiveRecord::Base
	has_many :product_images, dependent: :destroy
	has_many :products , through: :product_images
	accepts_nested_attributes_for :product_images, allow_destroy: true

	mount_uploader :image_url, ImageUploader
	validates :image_url, presence: true
end
