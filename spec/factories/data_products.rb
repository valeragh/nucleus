# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_product do
    file_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_data.xlsx')))
  end
end
