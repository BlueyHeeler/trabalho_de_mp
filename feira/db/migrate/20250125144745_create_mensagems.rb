class CreateMensagems < ActiveRecord::Migration[8.0]
  def change
    create_table :mensagems do |t|
      t.string :mensagem
      t.references :user, null: false, foreign_key: true
      t.references :feirante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
