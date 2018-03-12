# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end

  factory :invalid_user, parent: :user do
	  email nil
  end
end
