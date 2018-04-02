# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  image_url        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  shot_description :string
#

class Post < ActiveRecord::Base
	validates :title, :image_url, :description, presence: true

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
