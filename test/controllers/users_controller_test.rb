require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	setup do
     sign_in users(:harry) 
   end

	test "should redirect edit when not logged in" do
  	  assert_redirected_to new_user_session_url
    end

  test "should get home" do
      get :show
      assert_response :success
    end

end