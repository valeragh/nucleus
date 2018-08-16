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
#  identif         :integer
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

  it "is invalid without a factory price" do
    product = build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("не может быть пустым")
  end

  it "is invalid without a factory identif" do
    product = build(:product, identif: nil)
    product.valid?
    expect(product.errors[:identif]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

end

