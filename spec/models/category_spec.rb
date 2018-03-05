require 'rails_helper'
require 'carrierwave/test/matchers'

describe Category do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    category = build(:category, title: nil)
    category.valid?
    expect(category.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    category = build(:category, image_url: nil)
    category.valid?
    expect(category.errors[:image_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      category = build(:category)
      expect(category.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 500 by 500 pixels" do
      category = build(:category)
      expect(category.image_url.category).to be_no_larger_than(500, 500)
    end


    it "has the correct format" do
      category = build(:category)
      expect(category.image_url).to be_format('JPEG')
    end
  end

end
