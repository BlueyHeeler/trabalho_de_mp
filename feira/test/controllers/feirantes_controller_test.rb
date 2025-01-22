require "test_helper"

class FeirantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feirante = feirantes(:one)
  end

  test "should get index" do
    get feirantes_url
    assert_response :success
  end

  test "should get new" do
    get new_feirante_url
    assert_response :success
  end

  test "should create feirante" do
    assert_difference("Feirante.count") do
      post feirantes_url, params: { feirante: { email: @feirante.email, localizacao: @feirante.localizacao, nome: @feirante.nome, senha: @feirante.senha, sobre: @feirante.sobre } }
    end

    assert_redirected_to feirante_url(Feirante.last)
  end

  test "should show feirante" do
    get feirante_url(@feirante)
    assert_response :success
  end

  test "should get edit" do
    get edit_feirante_url(@feirante)
    assert_response :success
  end

  test "should update feirante" do
    patch feirante_url(@feirante), params: { feirante: { email: @feirante.email, localizacao: @feirante.localizacao, nome: @feirante.nome, senha: @feirante.senha, sobre: @feirante.sobre } }
    assert_redirected_to feirante_url(@feirante)
  end

  test "should destroy feirante" do
    assert_difference("Feirante.count", -1) do
      delete feirante_url(@feirante)
    end

    assert_redirected_to feirantes_url
  end
end
