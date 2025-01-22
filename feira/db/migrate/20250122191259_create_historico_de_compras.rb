class CreateHistoricoDeCompras < ActiveRecord::Migration[8.0]
  def change
    create_table :historico_de_compras do |t|
      t.integer :quantidade
      t.references :user, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
