class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :pod_category
  has_many :reviews

	validates :title, :image_url, :category_id, :pod_category_id, :description, :status, presence: true
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
    self.update_column(:category_id, self.pod_category.category_id)
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
