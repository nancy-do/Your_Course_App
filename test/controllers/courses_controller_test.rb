require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get courses_path
    assert_response :success
  end

  test "should get new" do
    get create_course_path
    assert_response :success
  end

  test "should get create" do
    get create_course_path
    assert_response :success
  end

end
