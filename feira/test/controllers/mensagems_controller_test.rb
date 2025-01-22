require "test_helper"

class MensagemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mensagem = mensagems(:one)
  end

  test "should get index" do
    get mensagems_url
    assert_response :success
  end

  test "should get new" do
    get new_mensagem_url
    assert_response :success
  end

  test "should create mensagem" do
    assert_difference("Mensagem.count") do
      post mensagems_url, params: { mensagem: { feirante_id: @mensagem.feirante_id, mensagem: @mensagem.mensagem, user_id: @mensagem.user_id } }
    end

    assert_redirected_to mensagem_url(Mensagem.last)
  end

  test "should show mensagem" do
    get mensagem_url(@mensagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_mensagem_url(@mensagem)
    assert_response :success
  end

  test "should update mensagem" do
    patch mensagem_url(@mensagem), params: { mensagem: { feirante_id: @mensagem.feirante_id, mensagem: @mensagem.mensagem, user_id: @mensagem.user_id } }
    assert_redirected_to mensagem_url(@mensagem)
  end

  test "should destroy mensagem" do
    assert_difference("Mensagem.count", -1) do
      delete mensagem_url(@mensagem)
    end

    assert_redirected_to mensagems_url
  end
end
