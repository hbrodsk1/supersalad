FactoryGirl.define do
	factory :vote do |f|
		f.user_id user
		f.food_id food
	end
end