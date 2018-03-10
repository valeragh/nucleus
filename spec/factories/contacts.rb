# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    title "MyString"
    description "MyString"
    phone_one "MyString"
    phone_two "MyString"
    address "MyString"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
    longitude 1.5
    latitude 1.5
    status "Показать"
  end
end
