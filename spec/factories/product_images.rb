# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#  product_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_image do
    product_id 1
    image_id 1
  end
end
