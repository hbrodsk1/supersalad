require 'rails_helper'

RSpec.describe UsersController , :type => :controller do

  before(:each) do
      @user = create(:user)
      sign_in(@user)
    end
  
  describe "GET #index" do
    it "assigns @users" do
      get :index
      expect(assigns(:users)).to eq([@user])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested food to @user" do
      get :show, params: { id: @user.id }
      expect(assigns(:user)).to eq(@user)
    end
  
    it "renders the #show view" do
      get :show, params: { id: @user.id }
      expect(response).to render_template :show
    end
  end  
end
	

