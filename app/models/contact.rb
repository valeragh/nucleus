# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  phone_one   :string
#  phone_two   :string
#  address     :string
#  longitude   :float
#  latitude    :float
#  status      :string           default("Показать")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#

class Contact < ActiveRecord::Base
	geocoded_by :address
  after_validation :geocode

  validates :title, :description, :phone_one, :phone_two, :image_url, :address, :status, presence: true
  mount_uploader :image_url, ImageUploader

  # Enumerize
  extend Enumerize
  enumerize :status, in: ["Показать", "Скрыть"], default: "Показать"
  STATUS_TYPES = ["Показать", "Скрыть"]

  def phones
  	phone_one + "," + phone_two
  end
end
