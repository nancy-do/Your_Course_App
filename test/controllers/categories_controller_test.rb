require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get create_category_path
    assert_response :success
  end

  test "should get show" do
    get categories_path
    assert_response :success
  end

  test "should get create" do
    get create_category_path
    assert_response :success
  end

end
