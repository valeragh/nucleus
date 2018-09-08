# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  quantity    :integer          default(1)
#  total_price :decimal(12, 3)
#  unit_price  :decimal(12, 3)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :integer
#  order_id    :integer
#  product_id  :integer
#
# Indexes
#
#  index_order_items_on_cart_id     (cart_id)
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    quantity 1
    product_id 1
    cart_id 1
  end
end
