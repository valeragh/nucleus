require 'rails_helper'

describe Review do
  it "is invalid without a factory name" do
    review = build(:review, name: nil)
    review.valid?
    expect(review.errors[:name]).to include("не может быть пустым")
  end

  it "is invalid without a factory product_id" do
    review = build(:review, product_id: nil)
    review.valid?
    expect(review.errors[:product_id]).to include("не может быть пустым")
  end

  it "is invalid without a factory description" do
    review = build(:review, description: nil)
    review.valid?
    expect(review.errors[:description]).to include("не может быть пустым")
  end

  it "is invalid without a factory status" do
    review = build(:review, status: nil)
    review.valid?
    expect(review.errors[:status]).to include("не может быть пустым")
  end

  it "has a valid factory" do
    expect(build(:review)).to be_valid
  end
end
