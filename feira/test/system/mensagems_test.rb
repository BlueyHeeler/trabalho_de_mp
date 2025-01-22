require "application_system_test_case"

class MensagemsTest < ApplicationSystemTestCase
  setup do
    @mensagem = mensagems(:one)
  end

  test "visiting the index" do
    visit mensagems_url
    assert_selector "h1", text: "Mensagems"
  end

  test "should create mensagem" do
    visit mensagems_url
    click_on "New mensagem"

    fill_in "Feirante", with: @mensagem.feirante_id
    fill_in "Mensagem", with: @mensagem.mensagem
    fill_in "User", with: @mensagem.user_id
    click_on "Create Mensagem"

    assert_text "Mensagem was successfully created"
    click_on "Back"
  end

  test "should update Mensagem" do
    visit mensagem_url(@mensagem)
    click_on "Edit this mensagem", match: :first

    fill_in "Feirante", with: @mensagem.feirante_id
    fill_in "Mensagem", with: @mensagem.mensagem
    fill_in "User", with: @mensagem.user_id
    click_on "Update Mensagem"

    assert_text "Mensagem was successfully updated"
    click_on "Back"
  end

  test "should destroy Mensagem" do
    visit mensagem_url(@mensagem)
    click_on "Destroy this mensagem", match: :first

    assert_text "Mensagem was successfully destroyed"
  end
end
