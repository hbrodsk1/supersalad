FactoryGirl.define do
	factory :food do |f|
		f.kind "soup"
		f.title "Clam Chowder"
		f.image { Rack::Test::UploadedFile.new(File.join(Rails.root, '/app/assets/images/Canada.png')) }
	end

	factory :invalid_food, parent: :food do |f|
		f.kind nil
	end
end