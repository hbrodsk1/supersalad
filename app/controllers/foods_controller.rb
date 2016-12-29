class FoodsController < ApplicationController

  def index
    @foods = Food.all
  end

  def soup
    @soups = Food.sort_by(params[:sort_by], "soup").paginate(page: params[:page], per_page: 3)
  end

  def salad
    @salads = Food.sort_by(params[:sort_by], "salad").paginate(page: params[:page], per_page: 3)
  end

  def new
  	@food = Food.new
  end

  def create
  	@food = current_user.foods.build(food_params)

  	if @food.save
      flash[:success] = "Ready To Eat!"
  		redirect_to user_path(@food.user_id)
  	else
  		render 'new'
  	end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update(food_params)
      flash[:success] = "Fresh out of the oven... again!"
      redirect_to food_path(@food.id)
    else
      render 'edit'
    end
  end

  def destroy
  	@food = Food.find(params[:id])
  	if @food.destroy
  		redirect_to user_path(current_user.id)
  	end
  end

  def result
    @winning_food = Food.find(params[:id])
    Food.food_win(@winning_food)
    Food.update_win_percentage(@winning_food)

    @losing_food = Food.find(params[:lose_id])
    Food.food_lose(@losing_food)
    Food.update_win_percentage(@losing_food)

    redirect_to home_path
  end


  private

  	def food_params
  		params.require(:food).permit(:id, :kind, :title, :user_id, :image, :wins, :loses, :recipe, :description)
  	end
end
