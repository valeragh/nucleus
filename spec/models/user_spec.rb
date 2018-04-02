# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string
#  phone                  :string
#

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

