class CreateAvaliacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :avaliacaos do |t|
      t.integer :nota
      t.string :comentario
      t.references :user, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
