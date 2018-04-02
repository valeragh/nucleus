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

  scope :in_progress, ->{where("letters.checked_out_at IS NULL")}
  scope :complete, -> {where("letters.checked_out_at IS NOT NULL")}

  COMPLETE = "обработка"
  IN_PROGRESS = "новый"

  def checkout!
    self.checked_out_at = Time.now
    self.save
  end

  def state
    checked_out_at.nil? ? IN_PROGRESS : COMPLETE
  end
end
