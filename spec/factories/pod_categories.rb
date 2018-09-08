# == Schema Information
#
# Table name: pod_categories
#
#  id          :integer          not null, primary key
#  image_url   :string
#  rang        :integer
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_pod_categories_on_slug  (slug) UNIQUE
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
