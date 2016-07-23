require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

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
    get new_user_session_path
    post user_session_path, params: { user: { email: 't@t.com',
                                          password: 'asdfasdf' } }
    follow_redirect!
    assert_select "a[href=?]", destroy_user_session_path
  end
end
