# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  phone_one   :string
#  phone_two   :string
#  address     :string
#  longitude   :float
#  latitude    :float
#  status      :string           default("Показать")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#

require 'rails_helper'
require 'carrierwave/test/matchers'

describe Contact do
  include CarrierWave::Test::Matchers

  it "is invalid without a factory title" do
    contact = build(:contact, title: nil)
    contact.valid?
    expect(contact.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory phone_one" do
    contact = build(:contact, phone_one: nil)
    contact.valid?
    expect(contact.errors[:phone_one]).to include("не может быть пустым")
  end

  it "is invalid without a factory phone_two" do
    contact = build(:contact, phone_two: nil)
    contact.valid?
    expect(contact.errors[:phone_two]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    contact = build(:contact, description: nil)
    contact.valid?
    expect(contact.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    contact = build(:contact, status: nil)
    contact.valid?
    expect(contact.errors[:status]).to include("не может быть пустым")
  end

  it "is invalid without a factory image_url" do
    contact = build(:contact, image_url: nil)
    contact.valid?
    expect(contact.errors[:image_url]).to include("не может быть пустым")
  end

  it "is invalid without a factory address" do
    contact = build(:contact, address: nil)
    contact.valid?
    expect(contact.errors[:address]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  context 'the all versions version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      contact = build(:contact)
      expect(contact.image_url.thumb).to have_dimensions(50, 50)
    end

    it "scales down a large image to to fit within 600 by 400 pixels" do
      contact = build(:contact)
      expect(contact.image_url.magazine).to be_no_larger_than(600, 400)
    end


    it "has the correct format" do
      contact = build(:contact)
      expect(contact.image_url).to be_format('JPEG')
    end
  end

end

