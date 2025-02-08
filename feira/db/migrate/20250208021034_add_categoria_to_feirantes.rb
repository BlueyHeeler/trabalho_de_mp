class AddCategoriaToFeirantes < ActiveRecord::Migration[8.0]
  def change
    add_column :feirantes, :categoria, :string
  end
end
