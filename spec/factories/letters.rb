# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :letter do
    name "MyString"
    description "MyText"
    email "email@test.com"
    checked_out_at "2018-03-10 09:12:33"
    status "MyString"
  end

  factory :invalid_letter, parent: :letter do
    name nil
  end
end
