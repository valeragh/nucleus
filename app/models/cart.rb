# == Schema Information
#
# Table name: carts
#
#  id              :integer          not null, primary key
#  total           :decimal(12, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_status_id :integer
#
# Indexes
#
#  index_carts_on_order_status_id  (order_status_id)
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
