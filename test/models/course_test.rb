require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @category = Category.new(name: "Web Servers and Web Technology")
    @location = Location.new(building: 10, level: 10, room:30)
    @user = User.new(name: "Example User", email: "example.user@rmit.edu.au", password:"foOBar123!@#", password_confirmation:"foOBar123!@#")
    @course = Course.new(name:"Example Examplee", prerequisite: "Example exampskhj", description:"Example Description",
                          user_id: 1, location_ids: [@location.id], category_ids: [@category.id])
  end 
  
  test "should be valid" do
    assert @course.valid?
  end
  
  # test "name should be present" do
  #   @course.name = "     "
  #   assert_not @course.valid?
  # end
  
  # test "Prerequisite  should be present" do
  #   @course.prerequisite = "     "
  #   assert_not @course.prerequisite?
  # end
  
  # test "description  should be present" do
  #   @course.description = "     "
  #   assert_not @course.description?
  # end
end
