class AvaliacaoShopping < ActiveRecord::Migration[8.0]
  def change
    create_table :avaliacaosShopping do |t|
      t.integer :nota
      t.string :comentario
      t.references :usuario, null: false, foreign_key: true
      t.references :shopping, null: false, foreign_key: true
  
      t.timestamps
    end
  end
end
  