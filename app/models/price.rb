# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  price_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("Загружен")
#

class Price < ActiveRecord::Base

end
