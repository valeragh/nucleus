# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  phone_one   :string
#  phone_two   :string
#  address     :string
#  longitude   :float
#  latitude    :float
#  status      :string           default("Показать")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#

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
