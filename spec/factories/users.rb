FactoryGirl.define do
	factory :user do 
		sequence(:email) { |n| "user_#{n + 10}@factory.com" }
		password "foobar"
		confirmed_at Time.now
	end
end

require 'faker'

FactoryGirl.define do
  factory :person do
    email                 { Faker::Internet.email }
    password              "password"
    password_confirmation "password"
    confirmed_at Time.now
  end
end