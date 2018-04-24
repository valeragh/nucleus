# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  price_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price do
    price_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/price.xlsx')))
    status "Загружен"
  end
end
