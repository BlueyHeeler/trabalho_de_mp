class DeleteNotaShoppings < ActiveRecord::Migration[8.0]
  def change
    remove_column :shoppings, :nota, :float
  end
end
