FactoryGirl.define do
	factory :user do 
		sequence(:email) { |n| "user_#{n}@factory.com" }
		password "foobar"
		confirmed_at Time.now
	end
end