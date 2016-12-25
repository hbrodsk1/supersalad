class VotesController < ApplicationController

  def index
    @votes = Food.find(params[:food_id]).votes
  end

  def new
    @vote = current_user.votes.new
  end

  def create
    @user = current_user
    @vote = current_user.votes.build(vote_params)


    if @vote.save!
      @food = @vote.food
      respond_to do |format|
        format.html {redirect_to :back, notice: "Liked!"}
        format.js  
      end

      puts @vote.food.id
    else
      puts "No"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @user = current_user
    @vote = Vote.find(params[:id])
  end

  def destroy
    @vote = Vote.find(params[:id])
    @food = @vote.food

    if @vote.destroy!
      respond_to do |format|
        format.html {redirect_to :back, notice: "Unliked!"}
        format.js 
      end
    else
      puts "NOOOOOO"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:food_id)
  end
end
