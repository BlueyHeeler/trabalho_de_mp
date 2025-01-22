require "test_helper"

class HistoricoDeComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historico_de_compra = historico_de_compras(:one)
  end

  test "should get index" do
    get historico_de_compras_url
    assert_response :success
  end

  test "should get new" do
    get new_historico_de_compra_url
    assert_response :success
  end

  test "should create historico_de_compra" do
    assert_difference("HistoricoDeCompra.count") do
      post historico_de_compras_url, params: { historico_de_compra: { produto_id: @historico_de_compra.produto_id, quantidade: @historico_de_compra.quantidade, user_id: @historico_de_compra.user_id } }
    end

    assert_redirected_to historico_de_compra_url(HistoricoDeCompra.last)
  end

  test "should show historico_de_compra" do
    get historico_de_compra_url(@historico_de_compra)
    assert_response :success
  end

  test "should get edit" do
    get edit_historico_de_compra_url(@historico_de_compra)
    assert_response :success
  end

  test "should update historico_de_compra" do
    patch historico_de_compra_url(@historico_de_compra), params: { historico_de_compra: { produto_id: @historico_de_compra.produto_id, quantidade: @historico_de_compra.quantidade, user_id: @historico_de_compra.user_id } }
    assert_redirected_to historico_de_compra_url(@historico_de_compra)
  end

  test "should destroy historico_de_compra" do
    assert_difference("HistoricoDeCompra.count", -1) do
      delete historico_de_compra_url(@historico_de_compra)
    end

    assert_redirected_to historico_de_compras_url
  end
end
