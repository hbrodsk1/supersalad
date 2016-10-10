class Food < ApplicationRecord
	belongs_to :user
	has_many :votes

	mount_uploader :image, ImageUploader
end
