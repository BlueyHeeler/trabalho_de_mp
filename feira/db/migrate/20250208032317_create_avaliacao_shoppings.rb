class CreateAvaliacaoShoppings < ActiveRecord::Migration[8.0]
  def change
    create_table :avaliacao_shoppings do |t|
      t.integer :nota
      t.text :comentario
      t.references :usuario, null: false, foreign_key: true
      t.references :shopping, null: false, foreign_key: true

      t.timestamps
    end
  end
end
