# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  description :text
#  image_url   :string
#  slug        :string
#  status      :string           default("Показать")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_services_on_slug  (slug) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    title "MyString"
    description "MyText"
    status "Показать"
    image_url Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
  end
end
