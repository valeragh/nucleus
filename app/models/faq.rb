class Faq < ActiveRecord::Base
	validates :title, :description, presence: true
end
