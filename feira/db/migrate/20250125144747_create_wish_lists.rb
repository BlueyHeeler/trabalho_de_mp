class CreateWishLists < ActiveRecord::Migration[8.0]
  def change
    create_table :wish_lists do |t|
      t.integer :quantidade
      t.references :produto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
