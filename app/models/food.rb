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

    def Food.update_win_percentage(food)
      if food.loses == 0
        Food.find(food.id).update_attributes(win_percentage: 100)
      else
        Food.find(food.id).update_attributes(win_percentage: (food.wins.to_f / food.loses).round(2))
      end
    end

    def Food.sort_by(param, soup_or_salad)
      if param == nil
        Food.all.where(kind: soup_or_salad)
      elsif param == 'most_wins'
        Food.all.where(kind: soup_or_salad).order('wins DESC')
      elsif param == 'least_wins'
        Food.all.where(kind: soup_or_salad).order('wins ASC')
      elsif param == 'highest_win_perventage'
        Food.all.where(kind: soup_or_salad).order('win_percentage DESC')
      elsif param == 'lowest_win_perventage'
        Food.all.where(kind: soup_or_salad).order('win_percentage ASC')
      elsif param == 'newest'
        Food.all.where(kind: soup_or_salad).order('created_at DESC')
      elsif param == 'oldest'
        Food.all.where(kind: soup_or_salad).order('created_at ASC')
      end 
    end

    def separate_ingredients
      self.recipe.split("\r\n")
    end

    #glass half full version of luke warm: firemoist rhino as a doctor: rhinocologist snoop dogg poop log tea slogan: goes down warm, comes out wet
end
