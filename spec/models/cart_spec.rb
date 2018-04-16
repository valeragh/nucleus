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

require 'rails_helper'

describe Cart do
  it "has a valid factory" do
    expect(build(:cart)).to be_valid
  end
end
