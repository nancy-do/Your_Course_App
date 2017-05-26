require 'test_helper'

class RateTest < ActiveSupport::TestCase
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
    @rating.save
    @rate = Rate.new(user_id: @user.id, rating_id: @rating.id, rated: true, pressed: 0)
  end 
  
  test "should be valid" do
    assert @rate.valid?
  end
  
  test "User id should be present" do
    @rate.user_id = "     "
    assert_not @rate.valid?
  end
  
  test "rating id should be present" do
    @rate.rating_id = "     "
    assert_not @rate.valid?
  end
  
  test "rated should be present" do
    @rate.rated = nil
    assert_not @rate.valid?
  end
  
  test "pressed should be present" do
    @rate.pressed = "     "
    assert_not @rate.valid?
  end
  
  test "pressed is an integer" do 
    #0 = dislike
    #1 = like
    assert @rate.pressed.is_a? Integer
  end
end
