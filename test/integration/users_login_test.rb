require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: { session: { email: "", password: "" } }
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get user_session_path
    post user_session_path, params: { session: { email:    @user.email,
                                          password: '123greetings' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", user_session_path, count: 0
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", edit_user_registration_path(@user)
  end
end
