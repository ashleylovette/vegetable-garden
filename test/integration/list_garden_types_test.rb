require 'test_helper'

class ListGardenTypesTest < ActionDispatch::IntegrationTest
 def setup
  @garden_type = GardenType.create(name: "Container")
  @garden_type2 = GardenType.create(name: "Trellised")
 end

 test "should show garden types listing" do
  get '/garden_types'
  assert_select "a[href=?]", garden_type_path(@garden_type), text: @garden_type.name
  assert_select "a[href=?]", garden_type_path(@garden_type2), text: @garden_type2.name
  
 end

end
