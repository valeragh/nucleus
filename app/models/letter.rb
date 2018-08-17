# == Schema Information
#
# Table name: letters
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  email          :string
#  checked_out_at :datetime
#  status         :string           default("Новое")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Letter < ActiveRecord::Base
	validates :name, :description, :email, :status, presence: true

	validates_format_of :email, :with => /@/

  # Enumerize
  extend Enumerize
  enumerize :status, in: ["Новое", "Обработанное"], default: "Новое"
  STATUS_TYPES = ["Новое", "Обработанное"]

end
