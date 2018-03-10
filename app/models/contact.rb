class Contact < ActiveRecord::Base
	#geocoded_by :address
  #after_validation :geocode

  validates :title, :description, :phone_one, :phone_two, :image_url, :address, :status, presence: true
  mount_uploader :image_url, ImageUploader
end
