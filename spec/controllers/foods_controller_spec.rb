require 'rails_helper'

RSpec.describe FoodsController, :type => :controller do

  before(:each) do
      @user = create(:user)
      sign_in(@user)
    end
  
  describe "GET #index" do
    it "assigns @foods" do
      food = create(:food)
      get :index
      expect(assigns(:foods)).to eq([food])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested food to @food" do
      food = create(:food)
      get :show, params: { id: food.id }
      expect(assigns(:food)).to eq(food)
    end
  
    it "renders the #show view" do
      food = create(:food)
      get :show, params: { id: food.id }
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new food" do
        food_params = FactoryGirl.attributes_for(:food)
        expect { post :create, params: { food: food_params } }.to change(Food, :count).by(1)
      end

      it "redirects to user page of user who uploaded food" do
        food_params = FactoryGirl.attributes_for(:food)
        post :create, params: { food: food_params }
        expect(response).to redirect_to user_path(@user.id)
      end
    end

    context "with invalid attributes" do
      it "does not save the food" do
        food_params = FactoryGirl.attributes_for(:invalid_food)
        expect { post :create, params: { food: food_params } }.to_not change(Food, :count)
      end

      it "re-renders the new method" do
        food_params = FactoryGirl.attributes_for(:invalid_food)
        post :create, params: { food: food_params }
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT Update" do
    before :each do
      @food = FactoryGirl.create(:food)
    end

    context "valid attributes" do
      it "located the requested @food" do
        process :update, method: :put, params: { id: @food.id, food: FactoryGirl.attributes_for(:food) }
        expect(assigns(:food)).to eq(@food)
      end

      it "changes @food's attributes" do
        process :update, method: :put, params: { id: @food.id,
          food: FactoryGirl.attributes_for(:food, title: "Yummers", kind: "Salad") }
          @food.reload
          expect(@food.title).to eq("Yummers")
          expect(@food.kind).to eq("Salad")
      end

      it "redirects to the updated food" do
        process :update, method: :put, params: { id: @food.id, food: FactoryGirl.attributes_for(:food) }
        expect(response).to redirect_to @food
      end
    end

    context "invalid attributes" do
      it "locates the requested @food" do
        process :update, method: :put, params: { id: @food.id, food: FactoryGirl.attributes_for(:invalid_food) }
        expect(assigns(:food)).to eq(@food)
      end

      it "does not change @food's attributes" do
        process :update, method: :put, params: { id: @food.id,
          food: FactoryGirl.attributes_for(:food, title: "Yummers", kind: nil) }
        @food.reload
        expect(@food.title).to_not eq("Yummers")
        expect(@food.kind).to eq("soup")
      end

      it "re-renders the edit method" do
        process :update, method: :put, params: { id: @food.id, food: FactoryGirl.attributes_for(:invalid_food) }
        expect(response).to render_template :edit
      end
    end 
  end

  describe "DELETE destroy" do
    before :each do
      @food = create(:food)
    end

    it "deletes the food" do
      expect{ delete :destroy, params: { id: @food.id } }.to change(Food, :count).by(-1)
    end

    it "redirects to user page of user who deleted food" do
      delete :destroy, params: { id: @food.id }
      expect(response).to redirect_to user_path(@user.id)
    end
  end
end

