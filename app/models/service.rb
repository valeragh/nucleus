# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :text
#  image_url   :string
#  slug        :string
#  status      :string           default("Показать")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_services_on_slug  (slug) UNIQUE
#

class Service < ActiveRecord::Base
	validates :title, :description, :status, :image_url, presence: true

	mount_uploader :image_url, ImageUploader

	STATUS_TYPES = ["Показать","Скрыть"]

  # Enumerize
  extend Enumerize
  enumerize :status, in: ["Показать","Скрыть"], default: "Показать"
  
	extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
