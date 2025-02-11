class UpdateAuthenticationFields < ActiveRecord::Migration[8.0]
  def change
    add_column :administradors, :password_digest, :string
    remove_column :administradors, :senha
  end
end
