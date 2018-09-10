# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  description      :text
#  image_url        :string
#  shot_description :string
#  slug             :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_posts_on_slug  (slug) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    description "MyText"
    shot_description "MyString"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
  end
end
