require 'rails_helper'

describe User do

  it "is invalid without a factory email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("не может быть пустым")
  end

  it "is invalid without a factory password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
end

