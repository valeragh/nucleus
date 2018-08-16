require 'rails_helper'
require 'carrierwave/test/matchers'

describe Image do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory image_url" do
    image = build(:image, image_url: nil)
    image.valid?
    expect(image.errors[:image_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:image)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      image = build(:image)
      expect(image.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a image category to to fit within 500 by 500 pixels" do
      image = build(:image)
      expect(image.image_url.category).to be_no_larger_than(500, 500)
    end

    it "scales down a image magazine to to fit within 600 by 400 pixels" do
      image = build(:image)
      expect(image.image_url.magazine).to be_no_larger_than(600, 400)
    end

    it "has the correct format" do
      image = build(:image)
      expect(image.image_url).to be_format('JPEG')
    end
  end

end