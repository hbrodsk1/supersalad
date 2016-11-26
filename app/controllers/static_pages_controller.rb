class StaticPagesController < ApplicationController


  def home
  	@foods = Food.all
  	#@soup = Food.random_soup
  end

  def browse
  	@foods = Food.all
  end

  def about
  end

  def contact
  end

	
end
