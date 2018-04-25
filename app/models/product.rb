# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  image_url       :string
#  rang            :integer
#  pod_category_id :integer
#  category_id     :integer
#  status          :string           default("В наличие")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  price           :decimal(8, 2)
#  identif         :integer
#

class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :pod_category
  has_many :reviews
  has_many :order_items

	validates :title, :image_url, :category_id, :pod_category_id, :identif, :description, :price, :status, presence: true
	after_commit :create_category_id!, on: [:create, :update]
	
	mount_uploader :image_url, ImageUploader

	STATUS_TYPES = ["В наличие","Под заказ","Скрыть"]
	extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def create_category_id!
    if self.category_id.blank?
      self.update_column(:category_id, self.pod_category.category_id)
    end
  end

  def status_class
    if status == 'Под заказ'
      "bg-orange"
    end
  end

  def status_badge
    if status == 'Под заказ'
      "warning"
    else 
       "success"
    end
  end  

end
