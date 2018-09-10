# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :text
#  image_url   :string
#  slug        :string
#  status      :string           default("Показать")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_services_on_slug  (slug) UNIQUE
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe Service do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    service = build(:service, title: nil)
    service.valid?
    expect(service.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    service = build(:service, description: nil)
    service.valid?
    expect(service.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    service = build(:service, image_url: nil)
    service.valid?
    expect(service.errors[:image_url]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    service = build(:service, status: nil)
    service.valid?
    expect(service.errors[:status]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:service)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      service = build(:service)
      expect(service.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 600 by 400 pixels" do
      service = build(:service)
      expect(service.image_url.magazine).to be_no_larger_than(600, 400)
    end

    it "has the correct format" do
      service = build(:service)
      expect(service.image_url).to be_format('JPEG')
    end
  end

end

