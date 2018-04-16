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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    quantity 1
    product_id 1
    cart_id 1
  end
end
