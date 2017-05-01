require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get messages" do
    get messages_path
    assert_response :success
  end
  

end
