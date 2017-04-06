require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(roomNo: "14.10.31")
  end

  test "should be valid" do
    assert @location.valid?
  end
  
   test "Room number should be present" do
    @location.roomNo = "     "
    assert_not @location.valid?
  end
end
