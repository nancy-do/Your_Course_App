require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
  def setup
    @message = Message.new(name: "Example Name", message: "Hello, this is a sample message!", email:"example.example@gmail.com")
  end
  
  test "should be valid" do
    assert @message.valid?
  end
  
  test "name should be present" do
    @message.name = " "
    assert_not @message.name?
  end
  
  test "email should be present" do
    @message.email = " "
    assert_not @message.email?
  end
  
  test "message should be present" do
    @message.message = " "
    assert_not @message.message?
  end
  
  test "name should be longer than 4 chars" do
    @message.name = "abc"
    assert_not @message.valid?
  end
  
  test "message is too long" do
    @message.message = "a" * 300
    assert_not @message.valid?
  end
  
  test "email is not valid" do
    @message.email = "abc.asdcds.com@"
    assert_not @message.valid?
  end
  
end
