require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: "Example User", email: "user@example.com", password: "password_field")
  end

  test "should not be valid" do
    assert_not @user.valid?
  end
end
