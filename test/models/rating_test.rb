require 'test_helper'

class RatingTest < ActiveSupport::TestCase
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
    @course.save
    @rating = Rating.new(likes:0, dislikes:0, course_id: @course.id)
  end 

  test "should be valid" do
    assert @rating.valid?
  end  
  
  test "likes should be present" do
    @rating.likes = "     "
    assert_not @rating.likes?
  end
  
  test "likes is an integer" do 
    assert @rating.likes.is_a? Integer
  end
  
  test "dislikes should be present" do
    @rating.dislikes = "     "
    assert_not @rating.dislikes?
  end
  
  test "dislikes is an integer" do 
    assert @rating.dislikes.is_a? Integer
  end
  
  test "course_id should be present" do
    @rating.course_id = "     "
    assert_not @rating.course_id?
  end
  
end
