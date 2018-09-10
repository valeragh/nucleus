# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  description     :text
#  identif         :integer
#  image_url       :string
#  price           :decimal(8, 2)
#  rang            :integer
#  slug            :string
#  status          :string           default(NULL)
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer
#  pod_category_id :integer
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyString"
    description "MyText"
    rang 1
    pod_category_id 1
    category_id 1
    status "В наличии"
    price "9.99"
    identif { Faker::Number.number(6) }
  end
end
