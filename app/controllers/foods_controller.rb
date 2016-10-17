class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def soup
    @soups = Food.all.where(kind: 'soup')
  end

  def salad
    @salads = Food.all.where(kind: 'salad')
  end

  def new
  	@food = Food.new
  end

  def create
  	@food = current_user.foods.build(food_params)

  	if @food.save
  		redirect_to user_path(@food.user_id)
  	else
  		render 'new'
  	end
  end

  def show
    @food = Food.find(params[:id])
  end

  def destroy
  	@food = Food.find(params[:id])
  	if @food.destroy
  		redirect_to user_path(current_user.id)
  	end

  end


  private

  	def food_params
  		params.require(:food).permit(:kind, :title, :user_id, :image, :wins, :loses, :recipe, :description)
  	end
end
