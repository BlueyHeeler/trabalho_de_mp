class AjusteNaAvaliacaoFeirante < ActiveRecord::Migration[8.0]
  def change
    remove_reference :avaliacao_feirantes, :usuario, foreign_key: true
    add_reference :avaliacao_feirantes, :user, foreign_key: true
  end
end
