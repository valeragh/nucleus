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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :letter do
    name "MyString"
    description "MyText"
    email "email@test.com"
    checked_out_at "2018-03-10 09:12:33"
    status "MyString"
  end

  factory :invalid_letter, parent: :letter do
    name nil
  end
end
