class RenameUsuarioIdToUserIdInMensagems < ActiveRecord::Migration[8.0]
  def change
    rename_column :mensagems, :usuario_id, :user_id
  end
end
