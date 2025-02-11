class DropAvaliacaosShoppingTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :avaliacaosShopping
  end
end