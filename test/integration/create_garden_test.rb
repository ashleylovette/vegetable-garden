require 'test_helper'

class CreateGardenTest < ActionDispatch::IntegrationTest
  test "get new garden type form and create garden type" do
    get "/garden_types/new"
    assert_response :success
    assert_difference 'GardenType.count', 1 do
      post garden_types_path, params: { garden_type: {name: "Container"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Container", response.body
  end

  test "get new garden type form and reject invalid garden type submission" do
    get "/garden_types/new"
    assert_response :success
    assert_no_difference 'GardenType.count' do
      post garden_types_path, params: { garden_type: {name: " "}}
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4'
  end
end
