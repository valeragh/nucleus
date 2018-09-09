# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  image_url  :string
#  rang       :integer
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
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
