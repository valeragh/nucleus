# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  product_id  :integer
#  status      :string           default("Скрыть")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
	belongs_to :product
	validates :name, :description, :product_id, :status, presence: true

	# Enumerize
  extend Enumerize
  enumerize :status, in: ["Показать", "Скрыть"], default: "Скрыть"

	STATUS_TYPES = ['Показать', 'Скрыть']
end
