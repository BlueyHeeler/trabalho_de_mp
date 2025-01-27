require "application_system_test_case"

class FeirantesTest < ApplicationSystemTestCase
  setup do
    @feirante = feirantes(:one)
  end

  test "visiting the index" do
    visit feirantes_url
    assert_selector "h1", text: "Feirantes"
  end

  test "should create feirante" do
    visit feirantes_url
    click_on "New feirante"

    fill_in "Contato", with: @feirante.contato
    fill_in "Descricao", with: @feirante.descricao
    fill_in "Email", with: @feirante.email
    fill_in "Localizacao", with: @feirante.localizacao
    fill_in "Nome", with: @feirante.nome
    fill_in "References", with: @feirante.references
    fill_in "Senha", with: @feirante.senha
    fill_in "Shopping", with: @feirante.shopping
    click_on "Create Feirante"

    assert_text "Feirante was successfully created"
    click_on "Back"
  end

  test "should update Feirante" do
    visit feirante_url(@feirante)
    click_on "Edit this feirante", match: :first

    fill_in "Contato", with: @feirante.contato
    fill_in "Descricao", with: @feirante.descricao
    fill_in "Email", with: @feirante.email
    fill_in "Localizacao", with: @feirante.localizacao
    fill_in "Nome", with: @feirante.nome
    fill_in "References", with: @feirante.references
    fill_in "Senha", with: @feirante.senha
    fill_in "Shopping", with: @feirante.shopping
    click_on "Update Feirante"

    assert_text "Feirante was successfully updated"
    click_on "Back"
  end

  test "should destroy Feirante" do
    visit feirante_url(@feirante)
    click_on "Destroy this feirante", match: :first

    assert_text "Feirante was successfully destroyed"
  end
end
