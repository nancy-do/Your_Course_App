require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_message_path
    assert_response :success
  end

  test "should get index" do
    get messages_index_url
    assert_response :success
  end

end
