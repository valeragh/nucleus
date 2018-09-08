# == Schema Information
#
# Table name: pod_categories
#
#  id          :integer          not null, primary key
#  image_url   :string
#  rang        :integer
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_pod_categories_on_slug  (slug) UNIQUE
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe PodCategory do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    pod_category = build(:pod_category, title: nil)
    pod_category.valid?
    expect(pod_category.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory category_id" do
    pod_category = build(:pod_category, category_id: nil)
    pod_category.valid?
    expect(pod_category.errors[:category_id]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    pod_category = build(:pod_category, image_url: nil)
    pod_category.valid?
    expect(pod_category.errors[:image_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:pod_category)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      pod_category = build(:pod_category)
      expect(pod_category.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 500 by 500 pixels" do
      pod_category = build(:pod_category)
      expect(pod_category.image_url.category).to be_no_larger_than(500, 500)
    end


    it "has the correct format" do
      pod_category = build(:pod_category)
      expect(pod_category.image_url).to be_format('JPEG')
    end
  end

end
