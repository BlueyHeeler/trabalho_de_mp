require "application_system_test_case"

class WishListsTest < ApplicationSystemTestCase
  setup do
    @wish_list = wish_lists(:one)
  end

  test "visiting the index" do
    visit wish_lists_url
    assert_selector "h1", text: "Wish lists"
  end

  test "should create wish list" do
    visit wish_lists_url
    click_on "New wish list"

    fill_in "Produto", with: @wish_list.produto_id
    fill_in "Quantidade", with: @wish_list.quantidade
    fill_in "User", with: @wish_list.user_id
    click_on "Create Wish list"

    assert_text "Wish list was successfully created"
    click_on "Back"
  end

  test "should update Wish list" do
    visit wish_list_url(@wish_list)
    click_on "Edit this wish list", match: :first

    fill_in "Produto", with: @wish_list.produto_id
    fill_in "Quantidade", with: @wish_list.quantidade
    fill_in "User", with: @wish_list.user_id
    click_on "Update Wish list"

    assert_text "Wish list was successfully updated"
    click_on "Back"
  end

  test "should destroy Wish list" do
    visit wish_list_url(@wish_list)
    click_on "Destroy this wish list", match: :first

    assert_text "Wish list was successfully destroyed"
  end
end
