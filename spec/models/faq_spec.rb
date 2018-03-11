require 'rails_helper'

describe Faq do
  it "is invalid without a factory title" do
    faq = build(:faq, title: nil)
    faq.valid?
    expect(faq.errors[:title]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    faq = build(:faq, description: nil)
    faq.valid?
    expect(faq.errors[:description]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:faq)).to be_valid
  end
end
