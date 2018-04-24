# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  price_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe Price do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory price_url" do
    price = build(:price, price_url: nil)
    price.valid?
    expect(price.errors[:price_url]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    price = build(:price, status: nil)
    price.valid?
    expect(price.errors[:status]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:price)).to be_valid
  end

  
end