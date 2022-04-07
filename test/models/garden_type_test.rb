require 'test_helper'

class GardenTypeTest < ActiveSupport::TestCase

  def setup
    @garden_type = GardenType.new(name: "Container")
  end
  
  test "garden type should be valid" do
    assert @garden_type.valid?
  end

  test "name should be present" do
    @garden_type.name = " "
    assert_not @garden_type.valid?
  end

  test "name should be unique" do
    @garden_type.save
    @garden_type2 = GardenType.new(name: "Container")
    assert_not @garden_type2.valid?
  end

  test "name should not be too long" do
    @garden_type.name = "a" * 26
    assert_not @garden_type.valid?
  end

  test "name should not be too short" do
    @garden_type.name = "aa"
    assert_not @garden_type.valid?
  end

end