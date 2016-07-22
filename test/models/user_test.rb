require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(user_name: "Example User", email: "user@example.com", password: "password_field")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
