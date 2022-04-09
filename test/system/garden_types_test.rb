require "application_system_test_case"

class GardenTypesTest < ApplicationSystemTestCase
  setup do
    @garden_type = garden_types(:one)
  end

  test "visiting the index" do
    visit garden_types_url
    assert_selector "h1", text: "Garden Types"
  end

  test "creating a Garden type" do
    visit garden_types_url
    click_on "New Garden Type"

    click_on "Create Garden type"

    assert_text "Garden type was successfully created"
    click_on "Back"
  end

  test "updating a Garden type" do
    visit garden_types_url
    click_on "Edit", match: :first

    click_on "Update Garden type"

    assert_text "Garden type was successfully updated"
    click_on "Back"
  end

  test "destroying a Garden type" do
    visit garden_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Garden type was successfully destroyed"
  end
end
