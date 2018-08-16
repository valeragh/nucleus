class Product::PriceImport
	include ActiveModel::Model
  
  attr_accessor :file, :imported_count
  validates :file, presence: true

  def process!
  	@imported_count = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      product = Product.assign_price_from_row(row)
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