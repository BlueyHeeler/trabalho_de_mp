class AddIsTempToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_temp, :boolean, default: false
  end
end
