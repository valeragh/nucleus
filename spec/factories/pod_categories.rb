# == Schema Information
#
# Table name: pod_categories
#
#  id          :integer          not null, primary key
#  title       :string
#  image_url   :string
#  rang        :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pod_category do
    title "MyString"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
    rang 1
    category_id 1
  end
end
