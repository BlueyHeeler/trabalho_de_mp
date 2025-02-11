class CreateShoppings < ActiveRecord::Migration[8.0]
  def change
    create_table :shoppings do |t|
      t.string :nome
      t.string :localizacao
      t.float :nota

      t.timestamps
    end
  end
end
