class DropAvaliacaoTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :avaliacaos
  end
end
