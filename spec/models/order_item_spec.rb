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

require 'rails_helper'

describe OrderItem do
  it "is invalid without a factory quantity" do
    order_item = build(:order_item, quantity: nil)
    order_item.valid?
    expect(order_item.errors[:quantity]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    product = create(:product)
    cart = create(:cart)
    expect(build(:order_item, product_id: product.id, cart_id: cart.id)).to be_valid
  end
end
