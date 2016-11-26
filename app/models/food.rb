class Food < ApplicationRecord
	belongs_to :user
	has_many :votes, dependent: :destroy

	validates :title, :kind, :image, presence: true

	mount_uploader :image, ImageUploader

	def Food.random_soup
  		Food.all.where(kind: 'soup').shuffle.first
  	end

  	def Food.random_salad
  		Food.all.where(kind: 'salad').shuffle.first
  	end

  	def Food.food_win(food)
  		Food.find(food.id).update(wins: food.wins + 1 )
  	end

  	def Food.food_lose(food)
  		Food.find(food.id).update(loses: food.loses + 1 )
  	end
end
