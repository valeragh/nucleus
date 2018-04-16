# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  quantity    :integer          default(1)
#  product_id  :integer
#  order_id    :integer
#  unit_price  :decimal(12, 3)
#  total_price :decimal(12, 3)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :integer
#

class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :cart
  before_save :finalize
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :cart_present


  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

	  def finalize
	    self[:unit_price] = unit_price
	    self[:total_price] = quantity * self[:unit_price]
	  end

    def product_present
      if product.nil?
        errors.add(:product, "не верное значение или не может активное")
      end
    end

    def cart_present
      if cart.nil?
        errors.add(:cart, "не верное значение")
      end
    end
    
 
end
