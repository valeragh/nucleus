# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  price_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Price < ActiveRecord::Base
	after_save :update_data
	validates :price_url, :status, presence: true
    mount_uploader :price_url, FileUploader

    def update_data
    	file = self.price_url.current_path
      spreadsheet = Roo::Spreadsheet.open(file)
	    header = spreadsheet.row(1)
	    (2..spreadsheet.last_row).each do |i|
		    row = Hash[[header, spreadsheet.row(i)].transpose]
		    product = Product.find_by_identif(row["identif"])
		    product.price = row["price"]
	      product.status = row["status"]
	      product.save!
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
	  ArgumentError.new('Everyone must have a first name.')
	end

end
