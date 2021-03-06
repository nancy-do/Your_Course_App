require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @category = Category.new(name: "Web Servers and Web Technology")
    @category.save
    @location = Location.new(building: 10, level: 10, room:30)
    @location.save
    @user = User.new(name: "Example User", email: "example.user@rmit.edu.au", password:"foOBar123$$$", password_confirmation:"foOBar123$$$")
    @user.save
    @course = Course.new(name:"Example Examplee", prerequisite: "Example exampskhj", description:"Example Description",
                          user_id: @user.id, location_ids: [@location.id], category_ids: [@category.id])
  end 
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "location should be valid" do
    assert @location.valid?
  end
  
  test "user should be valid" do
    assert @user.valid?
  end
  
  test "should be valid" do
    assert @course.valid?
  end
  
  test "name should be present" do
    @course.name = "     "
    assert_not @course.valid?
  end
  
  test "Prerequisite  should be present" do
    @course.prerequisite = "     "
    assert_not @course.prerequisite?
  end
  
  test "description  should be present" do
    @course.description = "     "
    assert_not @course.description?
  end
  
  test "name should be at least 4 chars" do
    @course.name = "abc"
    assert_not @course.valid?
  end
  
  test "Description is too long" do
    @course.description = "a" * 501
    assert_not @course.valid?
  end
end
