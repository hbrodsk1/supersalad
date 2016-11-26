class VotesController < ApplicationController

  def index
    @votes = Food.find(params[:food_id]).votes
  end

  def new
  	@vote = Vote.new
  end

  def create
    @user = current_user
  	@vote = Vote.new(vote_params)


  	if @vote.save
      puts @vote
  		flash[:notice] = "Thanks for voting!"
      redirect_back(fallback_location: root_path)
  	else
      puts "No"
  		flash[:notice] = "Something went wrong"
      redirect_back(fallback_location: root_path)
  	end
  end

  def show
    @user = current_user
    @vote = Vote.find(params[:id])
  end

  def destroy
    @vote = Vote.find(params[:id])

  	if @vote.destroy!
  		flash[:notice] = "Unvoted!"
      redirect_back(fallback_location: root_path)
  	end
  end

  private

  def vote_params
  	params.require(:vote).permit(:food_id, :user_id)
  end
end
