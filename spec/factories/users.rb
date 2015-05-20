# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	name "Bob Jones"
  	email "bob.jones@example.com"
  	password "notasecret"
  	password_confirmation "notasecret"
  end
end
