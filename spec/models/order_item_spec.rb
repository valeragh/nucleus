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
