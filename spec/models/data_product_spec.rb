require 'rails_helper'
require 'carrierwave/test/matchers'

describe DataProduct do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory file_url" do
    data_product = build(:data_product, file_url: nil)
    data_product.valid?
    expect(data_product.errors[:file_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:data_product)).to be_valid
  end

  
end
