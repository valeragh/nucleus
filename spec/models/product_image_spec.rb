# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#  product_id :integer
#

require 'rails_helper'

describe ProductImage do

  it "is invalid without a factory product_id" do
    product_image = build(:product_image, product_id: nil)
    product_image.valid?
    expect(product_image.errors[:product_id]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_id" do
    product_image = build(:product_image, image_id: nil)
    product_image.valid?
    expect(product_image.errors[:image_id]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:product_image)).to be_valid
  end

end
