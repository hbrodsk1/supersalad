require 'rails_helper'

RSpec.describe FoodsController, type: :controller do

	before(:each) do
	  @user = User.first
      @user.confirm
      sign_in @user
  	end

	describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do	
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

    describe "GET #soup" do
    it "responds successfully with an HTTP 200 status code" do	
      get :soup
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

    describe "GET #salad" do
    it "responds successfully with an HTTP 200 status code" do	
      get :salad
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do	
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do	
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end


end