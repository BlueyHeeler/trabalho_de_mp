require "test_helper"

class AvaliacaoFeirantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliacao_feirante = avaliacao_feirantes(:one)
  end

  test "should get index" do
    get avaliacao_feirantes_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliacao_feirante_url
    assert_response :success
  end

  test "should create avaliacao_feirante" do
    assert_difference("AvaliacaoFeirante.count") do
      post avaliacao_feirantes_url, params: { avaliacao_feirante: { comentario: @avaliacao_feirante.comentario, feirante_id: @avaliacao_feirante.feirante_id, nota: @avaliacao_feirante.nota, usuario_id: @avaliacao_feirante.usuario_id } }
    end

    assert_redirected_to avaliacao_feirante_url(AvaliacaoFeirante.last)
  end

  test "should show avaliacao_feirante" do
    get avaliacao_feirante_url(@avaliacao_feirante)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliacao_feirante_url(@avaliacao_feirante)
    assert_response :success
  end

  test "should update avaliacao_feirante" do
    patch avaliacao_feirante_url(@avaliacao_feirante), params: { avaliacao_feirante: { comentario: @avaliacao_feirante.comentario, feirante_id: @avaliacao_feirante.feirante_id, nota: @avaliacao_feirante.nota, usuario_id: @avaliacao_feirante.usuario_id } }
    assert_redirected_to avaliacao_feirante_url(@avaliacao_feirante)
  end

  test "should destroy avaliacao_feirante" do
    assert_difference("AvaliacaoFeirante.count", -1) do
      delete avaliacao_feirante_url(@avaliacao_feirante)
    end

    assert_redirected_to avaliacao_feirantes_url
  end
end
