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
	
end
