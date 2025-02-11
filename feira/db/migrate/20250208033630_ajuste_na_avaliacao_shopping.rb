class AjusteNaAvaliacaoShopping < ActiveRecord::Migration[8.0]
  def change
    remove_reference :avaliacao_shoppings, :usuario, foreign_key: true
    add_reference :avaliacao_shoppings, :user, foreign_key: true
  end
end
