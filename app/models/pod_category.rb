class PodCategory < ActiveRecord::Base
	belongs_to :category

	validates :title, :image_url, :category_id, presence: true

	mount_uploader :image_url, ImageUploader
	extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
