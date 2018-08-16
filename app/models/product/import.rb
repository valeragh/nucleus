class Product::Import
	include ActiveModel::Model
  
  attr_accessor :file, :imported_count
  validates :file, presence: true

  def process!
    categories_hash = Category.pluck(:title, :id).to_h
    pod_categories_hash = PodCategory.pluck(:title, :id).to_h
    images_hash = Image.pluck(:image_url, :id).to_h
  	@imported_count = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      product = Product.assign_from_row(row, categories_hash, pod_categories_hash, images_hash)
      if product.save
        @imported_count += 1
      else
      	errors.add(:base, "Line #{$.} - #{product.errors.full_messages.join(",")}")
      end
    end
  end

  def save
  	process! 
  	errors.none?
  end
end