require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get locations_path
    assert_response :success
  end
  
  test "should get new" do
    get create_location_path
    assert_response :success
  end
  
  test "should get create" do
    get create_location_path
    assert_response :success
  end

end
