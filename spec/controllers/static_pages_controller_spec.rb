require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

	before(:each) do
	  @user = User.first
      @user.confirm
      sign_in @user
  	end

	describe "GET #home" do
    it "responds successfully with an HTTP 200 status code" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do	
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #contact" do
    it "responds successfully with an HTTP 200 status code" do	
      get :contact
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end