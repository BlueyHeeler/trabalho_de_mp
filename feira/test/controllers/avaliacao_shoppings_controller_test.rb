require "test_helper"

class AvaliacaoShoppingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_shopping = avaliacao_shoppings(:one)
  end

  test "should get index" do
    get avaliacao_shoppings_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_shopping_url
    assert_response :success
  end

  test "should create avaliacao_shopping" do
    assert_difference("AvaliacaoShopping.count") do
      post avaliacao_shoppings_url, params: { avaliacao_shopping: { comentario: @avaliacao_shopping.comentario, nota: @avaliacao_shopping.nota, shopping_id: @avaliacao_shopping.shopping_id, usuario_id: @avaliacao_shopping.usuario_id } }
    end

    assert_redirected_to avaliacao_shopping_url(AvaliacaoShopping.last)
  end

  test "should show avaliacao_shopping" do
    get avaliacao_shopping_url(@avaliacao_shopping)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_shopping_url(@avaliacao_shopping)
    assert_response :success
  end

  test "should update avaliacao_shopping" do
    patch avaliacao_shopping_url(@avaliacao_shopping), params: { avaliacao_shopping: { comentario: @avaliacao_shopping.comentario, nota: @avaliacao_shopping.nota, shopping_id: @avaliacao_shopping.shopping_id, usuario_id: @avaliacao_shopping.usuario_id } }
    assert_redirected_to avaliacao_shopping_url(@avaliacao_shopping)
  end

  test "should destroy avaliacao_shopping" do
    assert_difference("AvaliacaoShopping.count", -1) do
      delete avaliacao_shopping_url(@avaliacao_shopping)
    end

    assert_redirected_to avaliacao_shoppings_url
  end
end
