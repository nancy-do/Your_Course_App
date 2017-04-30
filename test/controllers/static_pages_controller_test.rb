require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get category" do
    get category_path
    assert_response :success
  end

  test "should get locations" do
    get locations_path
    assert_response :success
  end

end
