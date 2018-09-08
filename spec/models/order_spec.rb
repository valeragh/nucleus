# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  data            :text
#  delivery        :string
#  description     :text
#  email           :string
#  payment_status  :string           default("Неоплаченный")
#  phone           :string
#  status          :string
#  total           :decimal(12, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_status_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#

require 'rails_helper'

describe Order do
  it "is invalid without a factory phone" do
    order = build(:order, phone: nil)
    order.valid?
    expect(order.errors[:phone]).to include("не может быть пустым")
  end

  it "is invalid without a factory delivery" do
    order = build(:order, delivery: nil)
    order.valid?
    expect(order.errors[:delivery]).to include("не может быть пустым")
  end

  it "is invalid without a factory email" do
    order = build(:order, email: nil)
    order.valid?
    expect(order.errors[:email]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:order)).to be_valid
  end
end
