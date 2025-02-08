class CreateAvaliacaoFeirantes < ActiveRecord::Migration[8.0]
  def change
    create_table :avaliacao_feirantes do |t|
      t.integer :nota
      t.text :comentario
      t.references :usuario, null: false, foreign_key: true
      t.references :feirante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
