require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new user registration page" do
    get new_user_registration_path
    assert_response :success
  end
end
