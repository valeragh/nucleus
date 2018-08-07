# == Schema Information
#
# Table name: data_products
#
#  id         :integer          not null, primary key
#  file_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DataProduct < ActiveRecord::Base
	after_save :update_data
	validates :file_url, presence: true
  mount_uploader :file_url, FileUploader

  def update_data
  	file = self.file_url.current_path
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    Product.find_or_create_by(identif: row["identif"]) do |product|
        product.identif = row["identif"]
  	    product.category_id = Category.where(:title => row["category"]).first.id
  	    product.pod_category_id = PodCategory.where(:title => row["pod_category"]).first.id
  	    
        product.title = row["title"]
  	    product.price = row["price"]
        product.status = row["status"]
        product.image_url = Rails.root.join("#{row["product_image"]}").open
        product.description = row["description"]
      end
    end
  rescue StandardError => e
    handle_exception(e)
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
	    when ".csv" then Csv.new(file.path, nil, :ignore)
	    when ".xls" then Excel.new(file.path, nil, :ignore)
	    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def handle_exception(error)
	  ArgumentError.new('Нет данных в базе')
	end
end
