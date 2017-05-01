require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Web Servers and Web Technology")
  end

  test "should be valid" do
    assert @category.valid?
  end
  
   test "Category name should be present" do
    @category.name = "     "
    assert_not @category.name?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 51
    assert_not @category.valid?
  end
end
