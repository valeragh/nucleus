# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  data            :text
#  delivery        :string
#  description     :text
#  email           :string
#  payment_status  :string           default("Неоплаченный")
#  phone           :string
#  status          :string
#  total           :decimal(12, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_status_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    status "Новый"
    user_id 1
    total "9.99"
    email "email@test.com"
    phone "(050)555-55-55"
    delivery "Новая почта"
  end

  factory :invalid_order, parent: :order do
    email nil
  end
end
