# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  image_url       :string
#  rang            :integer
#  pod_category_id :integer
#  category_id     :integer
#  status          :string           default("В наличие")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  price           :decimal(8, 2)
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe Product do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    product = build(:product, title: nil)
    product.valid?
    expect(product.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory category_id" do
    product = build(:product, category_id: nil)
    product.valid?
    expect(product.errors[:category_id]).to include("не может быть пустым")
  end

  it "is invalid without a factory pod_category_id" do
    product = build(:product, pod_category_id: nil)
    product.valid?
    expect(product.errors[:pod_category_id]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    product = build(:product, status: nil)
    product.valid?
    expect(product.errors[:status]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    product = build(:product, image_url: nil)
    product.valid?
    expect(product.errors[:image_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      product = build(:product)
      expect(product.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 500 by 500 pixels" do
      product = build(:product)
      expect(product.image_url.category).to be_no_larger_than(500, 500)
    end


    it "has the correct format" do
      product = build(:product)
      expect(product.image_url).to be_format('JPEG')
    end
  end

end

