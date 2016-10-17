class StaticPagesController < ApplicationController


  def home
  	@foods = Food.all
  	#@soup = Food.random_soup
  end

  def about
  end

  def contact
  end

	
end
