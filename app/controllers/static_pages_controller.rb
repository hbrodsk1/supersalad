class StaticPagesController < ApplicationController


  def home
  	@foods = Food.all
  end

  def browse
  	@foods = Food.all
  end

  def about
  end

  def contact
  end

	
end
