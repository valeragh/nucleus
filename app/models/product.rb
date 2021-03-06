# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  description     :text
#  identif         :integer
#  image_url       :string
#  price           :decimal(8, 2)
#  rang            :integer
#  slug            :string
#  status          :string           default(NULL)
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#  pod_category_id :integer
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#

class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :pod_category
  has_many :reviews
  has_many :order_items
  has_many :product_images, dependent: :destroy
  has_many :images, through: :product_images
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :product_images, allow_destroy: true

	validates :title, :identif, :category_id, :pod_category_id, :description, :price, :status, presence: true
	after_commit :create_category_id!, on: [:create, :update]
	
	mount_uploader :image_url, ImageUploader

	STATUS_TYPES = ["В наличии","Под заказ","Скрыть"]

  # Enumerize
  extend Enumerize
  enumerize :status, in: ["В наличии","Под заказ","Скрыть"], default: "В наличии"
  
	extend FriendlyId
  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize! :transliterations => [:russian, :latin]
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

  def self.assign_from_row(row, categories_hash, pod_categories_hash, images_hash)
    product = Product.where(identif: row[:identif]).first_or_initialize
    product.assign_attributes row.to_hash.slice(:title, :price, :status, :description)
    product.category_id = categories_hash[row[:category]]
    product.pod_category_id = pod_categories_hash[row[:pod_category]]      
    product.save
    if row[:product_image].present?
      ProductImage.find_or_create_by(product_id: product.id, image_id: images_hash[row[:product_image]])
    end
  end

  def self.assign_price_from_row(row)
    product = Product.where(identif: row[:identif]).first_or_initialize
    product.assign_attributes row.to_hash.slice(:price, :status)
    product
  end

  def create_category_id!
    if self.category_id.blank?
      self.update_column(:category_id, self.pod_category.category_id)
    end
  end

  def image_plitka
    if self.images.present?
      self.images.first.image_url.category
    else
      "android-chrome-512x512.png"
    end
  end

  def image
    if self.images.present?
      self.images.first.image_url.magazine
    else
      "android-chrome-512x512.png"
    end
  end

  def image_plitka_thumb
    if self.images.present?
      self.images.first.image_url.thumb
    else
      "apple-touch-icon-57x57.png"
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

  def price_admin
    ActionController::Base.helpers.number_to_currency(price, unit: "грн", separator: ",", precision: 2)
  end

  def self.to_csv
    attributes = %w{identif price status}

    CSV.generate(headers: true) do |csv|
      csv << attributes    
      all.each do |product|
        csv << product.attributes.values_at(*attributes)
      end
    end
  end

  def self.to_user_csv
    attributes = %w{identif title price}

    CSV.generate(headers: true) do |csv|
      csv << attributes    
      all.each do |product|
        csv << product.attributes.values_at(*attributes)
      end
    end
  end

end
