class UsersController < ApplicationController

  def index
  	@users = User.paginate(page: params[:page], per_page: 15).order('created_at DESC')
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
  
  def show
  	@user = User.find(params[:id])
  	@foods = @user.foods.paginate(page: params[:page], per_page: 10)
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
end
