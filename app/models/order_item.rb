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

  def total_price
    product.price * quantity
  end
  
 
end
