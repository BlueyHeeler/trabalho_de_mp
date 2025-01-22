class CreateFeirantes < ActiveRecord::Migration[8.0]
  def change
    create_table :feirantes do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.string :localizacao
      t.string :sobre

      t.timestamps
    end
  end
end
