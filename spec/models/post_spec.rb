# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  description      :text
#  image_url        :string
#  shot_description :string
#  slug             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe Post do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    post = build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    post = build(:post, description: nil)
    post.valid?
    expect(post.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    post = build(:post, image_url: nil)
    post.valid?
    expect(post.errors[:image_url]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      post = build(:post)
      expect(post.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 600 by 400 pixels" do
      post = build(:post)
      expect(post.image_url.magazine).to be_no_larger_than(600, 400)
    end

    it "has the correct format" do
      post = build(:post)
      expect(post.image_url).to be_format('JPEG')
    end
  end

end
