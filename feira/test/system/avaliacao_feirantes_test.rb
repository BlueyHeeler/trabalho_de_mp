require "application_system_test_case"

class AvaliacaoFeirantesTest < ApplicationSystemTestCase
  setup do
    @avaliacao_feirante = avaliacao_feirantes(:one)
  end

  test "visiting the index" do
    visit avaliacao_feirantes_url
    assert_selector "h1", text: "Avaliacao feirantes"
  end

  test "should create avaliacao feirante" do
    visit avaliacao_feirantes_url
    click_on "New avaliacao feirante"

    fill_in "Comentario", with: @avaliacao_feirante.comentario
    fill_in "Feirante", with: @avaliacao_feirante.feirante_id
    fill_in "Nota", with: @avaliacao_feirante.nota
    fill_in "Usuario", with: @avaliacao_feirante.usuario_id
    click_on "Create Avaliacao feirante"

    assert_text "Avaliacao feirante was successfully created"
    click_on "Back"
  end

  test "should update Avaliacao feirante" do
    visit avaliacao_feirante_url(@avaliacao_feirante)
    click_on "Edit this avaliacao feirante", match: :first

    fill_in "Comentario", with: @avaliacao_feirante.comentario
    fill_in "Feirante", with: @avaliacao_feirante.feirante_id
    fill_in "Nota", with: @avaliacao_feirante.nota
    fill_in "Usuario", with: @avaliacao_feirante.usuario_id
    click_on "Update Avaliacao feirante"

    assert_text "Avaliacao feirante was successfully updated"
    click_on "Back"
  end

  test "should destroy Avaliacao feirante" do
    visit avaliacao_feirante_url(@avaliacao_feirante)
    click_on "Destroy this avaliacao feirante", match: :first

    assert_text "Avaliacao feirante was successfully destroyed"
  end
end
