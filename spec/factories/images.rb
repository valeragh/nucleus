# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
  end
end
