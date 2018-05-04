# == Schema Information
#
# Table name: data_products
#
#  id         :integer          not null, primary key
#  file_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_product do
    file_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_data.xlsx')))
  end
end
