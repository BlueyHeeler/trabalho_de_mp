class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.string :localizacao

      t.timestamps
    end
  end
end
