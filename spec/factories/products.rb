# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  image_url       :string
#  rang            :integer
#  pod_category_id :integer
#  category_id     :integer
#  status          :string           default("В наличие")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  price           :decimal(8, 2)
#  identif         :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyString"
    description "MyText"
    rang 1
    pod_category_id 1
    category_id 1
    status "В наличие"
    price "9.99"
    identif "544"
  end
end
