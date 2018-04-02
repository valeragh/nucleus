# == Schema Information
#
# Table name: pod_categories
#
#  id          :integer          not null, primary key
#  title       :string
#  image_url   :string
#  rang        :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

class PodCategory < ActiveRecord::Base
	belongs_to :category
  has_many :products, :dependent => :destroy

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
