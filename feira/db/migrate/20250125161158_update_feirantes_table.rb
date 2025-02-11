class UpdateFeirantesTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :feirantes, :senha, :string
    remove_column :feirantes, :contato, :string
    remove_column :feirantes, :localizacao, :string
    remove_column :feirantes, :shopping, :string
    add_column :feirantes, :password_digest, :string
    add_reference :feirantes, :shopping, foreign_key: true
  end
end