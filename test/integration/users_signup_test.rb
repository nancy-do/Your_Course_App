require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Jenny Smith",
                                         email: "jenny.smith@rmit.edu.au",
                                         password:              "passWORD1@#!",
                                         password_confirmation: "passWORD1@#!" } }
    end
    follow_redirect!
    #assert_template 'static_pages/home'
    assert_not flash.empty?
    assert is_logged_in?
  end
  
end
