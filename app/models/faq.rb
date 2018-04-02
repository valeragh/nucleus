# == Schema Information
#
# Table name: faqs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Faq < ActiveRecord::Base
	validates :title, :description, presence: true
end
