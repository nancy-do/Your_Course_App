require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", last: "Example Last name", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
   test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "last name should be present" do
    @user.last = "     "
    assert_not @user.valid?
  end
  
end
