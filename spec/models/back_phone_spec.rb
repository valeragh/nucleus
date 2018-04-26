require 'rails_helper'

describe BackPhone do
  it "is invalid without a factory name" do
    back_phone = build(:back_phone, name: nil)
    back_phone.valid?
    expect(back_phone.errors[:name]).to include("не может быть пустым")
  end

  it "is invalid without a factory phone" do
    back_phone = build(:back_phone, phone: nil)
    back_phone.valid?
    expect(back_phone.errors[:phone]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:back_phone)).to be_valid
  end
end
