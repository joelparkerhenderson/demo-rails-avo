require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "should create item" do
    visit items_url
    click_on "New item"

    fill_in "Demo badge", with: @item.demo_badge
    check "Demo boolean" if @item.demo_boolean
    fill_in "Demo code", with: @item.demo_code
    fill_in "Demo country", with: @item.demo_country
    fill_in "Demo date", with: @item.demo_date
    fill_in "Demo datetime", with: @item.demo_datetime
    fill_in "Demo external image", with: @item.demo_external_image
    fill_in "Demo file", with: @item.demo_file
    fill_in "Demo files", with: @item.demo_files
    fill_in "Demo gravatar", with: @item.demo_gravatar
    fill_in "Demo markdown", with: @item.demo_markdown
    fill_in "Demo number", with: @item.demo_number
    fill_in "Demo password", with: @item.demo_password
    fill_in "Demo progress bar", with: @item.demo_progress_bar
    fill_in "Demo select", with: @item.demo_select
    fill_in "Demo status", with: @item.demo_status
    fill_in "Demo text", with: @item.demo_text
    fill_in "Demo textarea", with: @item.demo_textarea
    fill_in "Demo trix", with: @item.demo_trix
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "should update Item" do
    visit item_url(@item)
    click_on "Edit this item", match: :first

    fill_in "Demo badge", with: @item.demo_badge
    check "Demo boolean" if @item.demo_boolean
    fill_in "Demo code", with: @item.demo_code
    fill_in "Demo country", with: @item.demo_country
    fill_in "Demo date", with: @item.demo_date
    fill_in "Demo datetime", with: @item.demo_datetime
    fill_in "Demo external image", with: @item.demo_external_image
    fill_in "Demo file", with: @item.demo_file
    fill_in "Demo files", with: @item.demo_files
    fill_in "Demo gravatar", with: @item.demo_gravatar
    fill_in "Demo markdown", with: @item.demo_markdown
    fill_in "Demo number", with: @item.demo_number
    fill_in "Demo password", with: @item.demo_password
    fill_in "Demo progress bar", with: @item.demo_progress_bar
    fill_in "Demo select", with: @item.demo_select
    fill_in "Demo status", with: @item.demo_status
    fill_in "Demo text", with: @item.demo_text
    fill_in "Demo textarea", with: @item.demo_textarea
    fill_in "Demo trix", with: @item.demo_trix
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "should destroy Item" do
    visit item_url(@item)
    click_on "Destroy this item", match: :first

    assert_text "Item was successfully destroyed"
  end
end
