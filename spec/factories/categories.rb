# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  rang       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_url  :string
#  slug       :string
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "MyString"
    rang 1
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
  end
end
