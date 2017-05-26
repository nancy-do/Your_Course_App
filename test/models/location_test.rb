require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(building: 10, level: 10, room:30)
  end

  test "should be valid" do
    assert @location.valid?
  end
  
  test "building number should be present" do
    @location.building = "     "
    assert_not @location.building?
  end
  
  test "level number should be present" do
    @location.level = "     "
    assert_not @location.level?
  end
  
  test "room number should be present" do
    @location.room = "     "
    assert_not @location.room?
  end
  
  test "building numbers is an integer" do 
    assert @location.building.is_a? Integer
  end
  
  test "level numbers is an integer" do 
    assert @location.level.is_a? Integer
  end
  
  test "room numbers is an integer" do 
    assert @location.room.is_a? Integer
  end

  
end
