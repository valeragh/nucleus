# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  product_id  :integer
#  status      :string           default("Скрыть")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    name "MyString"
    description "MyText"
    product_id 1
    status "Показать"
  end

  factory :invalid_review, parent: :review do
    name nil
  end
end
