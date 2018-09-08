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

require 'rails_helper'

describe Cart do
  it "has a valid factory" do
    expect(build(:cart)).to be_valid
  end
end
