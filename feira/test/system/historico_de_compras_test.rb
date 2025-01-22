require "application_system_test_case"

class HistoricoDeComprasTest < ApplicationSystemTestCase
  setup do
    @historico_de_compra = historico_de_compras(:one)
  end

  test "visiting the index" do
    visit historico_de_compras_url
    assert_selector "h1", text: "Historico de compras"
  end

  test "should create historico de compra" do
    visit historico_de_compras_url
    click_on "New historico de compra"

    fill_in "Produto", with: @historico_de_compra.produto_id
    fill_in "Quantidade", with: @historico_de_compra.quantidade
    fill_in "User", with: @historico_de_compra.user_id
    click_on "Create Historico de compra"

    assert_text "Historico de compra was successfully created"
    click_on "Back"
  end

  test "should update Historico de compra" do
    visit historico_de_compra_url(@historico_de_compra)
    click_on "Edit this historico de compra", match: :first

    fill_in "Produto", with: @historico_de_compra.produto_id
    fill_in "Quantidade", with: @historico_de_compra.quantidade
    fill_in "User", with: @historico_de_compra.user_id
    click_on "Update Historico de compra"

    assert_text "Historico de compra was successfully updated"
    click_on "Back"
  end

  test "should destroy Historico de compra" do
    visit historico_de_compra_url(@historico_de_compra)
    click_on "Destroy this historico de compra", match: :first

    assert_text "Historico de compra was successfully destroyed"
  end
end
