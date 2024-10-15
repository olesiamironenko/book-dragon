require "application_system_test_case"

class ReadingListsTest < ApplicationSystemTestCase
  setup do
    @reading_list = reading_lists(:one)
  end

  test "visiting the index" do
    visit reading_lists_url
    assert_selector "h1", text: "Reading lists"
  end

  test "should create reading list" do
    visit reading_lists_url
    click_on "New reading list"

    fill_in "Name", with: @reading_list.name
    fill_in "User", with: @reading_list.user_id
    click_on "Create Reading list"

    assert_text "Reading list was successfully created"
    click_on "Back"
  end

  test "should update Reading list" do
    visit reading_list_url(@reading_list)
    click_on "Edit this reading list", match: :first

    fill_in "Name", with: @reading_list.name
    fill_in "User", with: @reading_list.user_id
    click_on "Update Reading list"

    assert_text "Reading list was successfully updated"
    click_on "Back"
  end

  test "should destroy Reading list" do
    visit reading_list_url(@reading_list)
    click_on "Destroy this reading list", match: :first

    assert_text "Reading list was successfully destroyed"
  end
end
