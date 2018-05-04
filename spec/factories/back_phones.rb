# == Schema Information
#
# Table name: back_phones
#
#  id             :integer          not null, primary key
#  name           :string
#  phone          :string
#  checked_out_at :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :back_phone do
    name "MyString"
    phone "MyString"
    checked_out_at "2018-04-26 13:26:24"
  end

  factory :invalid_back_phone, parent: :back_phone do
    name nil
  end
end
