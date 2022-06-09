require "application_system_test_case"

class Masterplan2dsTest < ApplicationSystemTestCase
  setup do
    @masterplan2d = masterplan2ds(:one)
  end

  test "visiting the index" do
    visit masterplan2ds_url
    assert_selector "h1", text: "Masterplan2ds"
  end

  test "should create masterplan2d" do
    visit masterplan2ds_url
    click_on "New masterplan2d"

    click_on "Create Masterplan2d"

    assert_text "Masterplan2d was successfully created"
    click_on "Back"
  end

  test "should update Masterplan2d" do
    visit masterplan2d_url(@masterplan2d)
    click_on "Edit this masterplan2d", match: :first

    click_on "Update Masterplan2d"

    assert_text "Masterplan2d was successfully updated"
    click_on "Back"
  end

  test "should destroy Masterplan2d" do
    visit masterplan2d_url(@masterplan2d)
    click_on "Destroy this masterplan2d", match: :first

    assert_text "Masterplan2d was successfully destroyed"
  end
end
