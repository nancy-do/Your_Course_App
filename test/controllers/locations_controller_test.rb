require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get locations_path
    assert_response :success
  end

end
