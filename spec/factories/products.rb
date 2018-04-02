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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    title "MyString"
    description "MyText"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
    rang 1
    pod_category_id 1
    category_id 1
    status "В наличие"
  end
end
