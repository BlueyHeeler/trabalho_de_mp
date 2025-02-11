class RemoveReferencesFromFeirantes < ActiveRecord::Migration[8.0]
  def change
    remove_column :feirantes, :references, :string
  end
end