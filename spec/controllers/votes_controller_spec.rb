require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

	

    describe "GET #new" do
    	before(:each) do
      @user = create(:user)
      sign_in(@user)
      @food = create(:food)
    end
    it "assigns a new vote to @vote" do
      get :new
      expect(assigns(:vote)).to be_a_new(Vote)
    end
  end

    describe "POST #create" do
      before(:each) do
      	@user = create(:user)
      	sign_in(@user)
      	@food = create(:food)
    end
      context "with valid attributes" do
  	    let(:vote_params) { FactoryGirl.attributes_for(:vote).merge(:user_id => @user, :food_id => @food) }

  	  it "creates a new vote" do
    	expect { post :create, params: { vote: vote_params } }.to change(Vote, :count).by(1)
  	  end

  	  it "Updates @user vote count" do
    	expect { post :create, params: { vote: vote_params } }.to change(@user.votes, :count).by(1)
  	  end

  	  it "Updates @food vote count" do
    	expect { post :create, params: { vote: vote_params } }.to change(@food.votes, :count).by(1)
  	  end
     end
    end

    describe "DELETE destroy" do
    	before :each do
    	  @user = create(:user)
      	  sign_in(@user)
          @food = create(:food)
      	  @vote = create(:vote, user_id: @user.id, food_id: @food.id)
    	end

      it "deletes the vote" do
        expect{ delete :destroy, params: { id: @vote.id } }.to change(Vote, :count).by(-1)
      end

       it "Updates @user vote count" do
    	expect{ delete :destroy, params: { id: @vote.id } }.to change(@user.votes, :count).by(-1)
  	  end

  	  it "Updates @food vote count" do
    	expect{ delete :destroy, params: { id: @vote.id } }.to change(@food.votes, :count).by(-1)
  	  end
    end
end