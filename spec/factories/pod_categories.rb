# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pod_category do
    title "MyString"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
    rang 1
    category_id 1
  end
end
