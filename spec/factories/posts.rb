# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  image_url        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  shot_description :string
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    description "MyText"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
  end
end
