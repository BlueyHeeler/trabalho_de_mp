require "application_system_test_case"

class AvaliacaoShoppingsTest < ApplicationSystemTestCase
  setup do
    @avaliacao_shopping = avaliacao_shoppings(:one)
  end

  test "visiting the index" do
    visit avaliacao_shoppings_url
    assert_selector "h1", text: "Avaliacao shoppings"
  end

  test "should create avaliacao shopping" do
    visit avaliacao_shoppings_url
    click_on "New avaliacao shopping"

    fill_in "Comentario", with: @avaliacao_shopping.comentario
    fill_in "Nota", with: @avaliacao_shopping.nota
    fill_in "Shopping", with: @avaliacao_shopping.shopping_id
    fill_in "Usuario", with: @avaliacao_shopping.usuario_id
    click_on "Create Avaliacao shopping"

    assert_text "Avaliacao shopping was successfully created"
    click_on "Back"
  end

  test "should update Avaliacao shopping" do
    visit avaliacao_shopping_url(@avaliacao_shopping)
    click_on "Edit this avaliacao shopping", match: :first

    fill_in "Comentario", with: @avaliacao_shopping.comentario
    fill_in "Nota", with: @avaliacao_shopping.nota
    fill_in "Shopping", with: @avaliacao_shopping.shopping_id
    fill_in "Usuario", with: @avaliacao_shopping.usuario_id
    click_on "Update Avaliacao shopping"

    assert_text "Avaliacao shopping was successfully updated"
    click_on "Back"
  end

  test "should destroy Avaliacao shopping" do
    visit avaliacao_shopping_url(@avaliacao_shopping)
    click_on "Destroy this avaliacao shopping", match: :first

    assert_text "Avaliacao shopping was successfully destroyed"
  end
end
