class Food < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy

	validates :title, :kind, :image, presence: true

	mount_uploader :image, ImageUploader

	def Food.random_soup
  		Food.all.where(kind: 'soup').shuffle
  	end
end
