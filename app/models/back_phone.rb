class BackPhone < ActiveRecord::Base
	validates :name, :phone, presence: true

	scope :in_progress, ->{where("back_phones.checked_out_at IS NULL")}
  scope :complete, -> {where("back_phones.checked_out_at IS NOT NULL")}

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
