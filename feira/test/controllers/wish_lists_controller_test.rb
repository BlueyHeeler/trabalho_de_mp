require "test_helper"

class WishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wish_list = wish_lists(:one)
  end

  test "should get index" do
    get wish_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_wish_list_url
    assert_response :success
  end

  test "should create wish_list" do
    assert_difference("WishList.count") do
      post wish_lists_url, params: { wish_list: { produto_id: @wish_list.produto_id, quantidade: @wish_list.quantidade, user_id: @wish_list.user_id } }
    end

    assert_redirected_to wish_list_url(WishList.last)
  end

  test "should show wish_list" do
    get wish_list_url(@wish_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_wish_list_url(@wish_list)
    assert_response :success
  end

  test "should update wish_list" do
    patch wish_list_url(@wish_list), params: { wish_list: { produto_id: @wish_list.produto_id, quantidade: @wish_list.quantidade, user_id: @wish_list.user_id } }
    assert_redirected_to wish_list_url(@wish_list)
  end

  test "should destroy wish_list" do
    assert_difference("WishList.count", -1) do
      delete wish_list_url(@wish_list)
    end

    assert_redirected_to wish_lists_url
  end
end
