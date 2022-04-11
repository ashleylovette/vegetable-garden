require 'test_helper'

class GardenTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @garden_type = GardenType.create(name: "Container")
    @admin_user = User.create(username: "testadmin", email: "testadmin@admin.com", 
                              password: "password", admin: true)
  end

  test "should get index" do
    get garden_types_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_garden_type_path
    assert_response :success
  end

  test "should create garden_type" do
    sign_in_as(@admin_user)
    assert_difference('GardenType.count', 1) do
      post garden_types_url, params: { garden_type: { name: "Raised bed" } }
    end

    assert_redirected_to garden_type_url(GardenType.last)
  end

  test "should not create garden_type if not admin" do
    assert_no_difference('GardenType.count') do
      post garden_types_url, params: { garden_type: { name: "Raised bed" } }
    end

    assert_redirected_to garden_types_url
  end

  test "should show garden_type" do
    get garden_type_url(@garden_type)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_garden_type_url(@garden_type)
  #   assert_response :success
  # end

  # test "should update garden_type" do
  #   patch garden_type_url(@garden_type), params: { garden_type: {  } }
  #   assert_redirected_to garden_type_url(@garden_type)
  # end

  # test "should destroy garden_type" do
  #   assert_difference('GardenType.count', -1) do
  #     delete garden_type_url(@garden_type)
  #   end

  #   assert_redirected_to garden_types_url
  # end
end
