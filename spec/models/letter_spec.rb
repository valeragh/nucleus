# == Schema Information
#
# Table name: letters
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  email          :string
#  checked_out_at :datetime
#  status         :string           default("Новое")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

describe Letter do
  it "is invalid without a factory name" do
    letter = build(:letter, name: nil)
    letter.valid?
    expect(letter.errors[:name]).to include("не может быть пустым")
  end

  it "is invalid without a factory email" do
    letter = build(:letter, email: nil)
    letter.valid?
    expect(letter.errors[:email]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    letter = build(:letter, description: nil)
    letter.valid?
    expect(letter.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    letter = build(:letter, status: nil)
    letter.valid?
    expect(letter.errors[:status]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:letter)).to be_valid
  end
end
