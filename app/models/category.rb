# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  rang       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#  slug       :string
#

class Category < ActiveRecord::Base
  has_many :pod_categories, :dependent => :destroy
  has_many :products
	validates :title, :image_url, presence: true
  
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
