# == Schema Information
#
# Table name: carts
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  total           :decimal(12, 3)
#  order_status_id :integer
#

class Cart < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private
    def update_subtotal
      self[:total] = subtotal
    end

end
