# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  user_id         :integer
#  total           :decimal(12, 3)
#  delivery        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  phone           :string
#  description     :text
#  email           :string
#  status          :string
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    status "Новый"
    user_id 1
    total "9.99"
    email "email@test.com"
    phone "5555555"
    delivery "Новая почта"
  end
end
