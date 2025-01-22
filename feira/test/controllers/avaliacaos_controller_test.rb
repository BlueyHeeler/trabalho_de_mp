require "test_helper"

class AvaliacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao = avaliacaos(:one)
  end

  test "should get index" do
    get avaliacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_url
    assert_response :success
  end

  test "should create avaliacao" do
    assert_difference("Avaliacao.count") do
      post avaliacaos_url, params: { avaliacao: { comentario: @avaliacao.comentario, nota: @avaliacao.nota, produto_id: @avaliacao.produto_id, user_id: @avaliacao.user_id } }
    end

    assert_redirected_to avaliacao_url(Avaliacao.last)
  end

  test "should show avaliacao" do
    get avaliacao_url(@avaliacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_url(@avaliacao)
    assert_response :success
  end

  test "should update avaliacao" do
    patch avaliacao_url(@avaliacao), params: { avaliacao: { comentario: @avaliacao.comentario, nota: @avaliacao.nota, produto_id: @avaliacao.produto_id, user_id: @avaliacao.user_id } }
    assert_redirected_to avaliacao_url(@avaliacao)
  end

  test "should destroy avaliacao" do
    assert_difference("Avaliacao.count", -1) do
      delete avaliacao_url(@avaliacao)
    end

    assert_redirected_to avaliacaos_url
  end
end
