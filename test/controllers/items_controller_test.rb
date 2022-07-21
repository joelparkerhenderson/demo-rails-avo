require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post items_url, params: { item: { demo_badge: @item.demo_badge, demo_boolean: @item.demo_boolean, demo_code: @item.demo_code, demo_country: @item.demo_country, demo_date: @item.demo_date, demo_datetime: @item.demo_datetime, demo_external_image: @item.demo_external_image, demo_file: @item.demo_file, demo_files: @item.demo_files, demo_gravatar: @item.demo_gravatar, demo_markdown: @item.demo_markdown, demo_number: @item.demo_number, demo_password: @item.demo_password, demo_progress_bar: @item.demo_progress_bar, demo_select: @item.demo_select, demo_status: @item.demo_status, demo_text: @item.demo_text, demo_textarea: @item.demo_textarea, demo_trix: @item.demo_trix } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { demo_badge: @item.demo_badge, demo_boolean: @item.demo_boolean, demo_code: @item.demo_code, demo_country: @item.demo_country, demo_date: @item.demo_date, demo_datetime: @item.demo_datetime, demo_external_image: @item.demo_external_image, demo_file: @item.demo_file, demo_files: @item.demo_files, demo_gravatar: @item.demo_gravatar, demo_markdown: @item.demo_markdown, demo_number: @item.demo_number, demo_password: @item.demo_password, demo_progress_bar: @item.demo_progress_bar, demo_select: @item.demo_select, demo_status: @item.demo_status, demo_text: @item.demo_text, demo_textarea: @item.demo_textarea, demo_trix: @item.demo_trix } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
