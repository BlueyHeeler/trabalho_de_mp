# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_08_174613) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "avaliacao_feirantes", force: :cascade do |t|
    t.integer "nota"
    t.text "comentario"
    t.integer "feirante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["feirante_id"], name: "index_avaliacao_feirantes_on_feirante_id"
    t.index ["user_id"], name: "index_avaliacao_feirantes_on_user_id"
  end

  create_table "avaliacao_shoppings", force: :cascade do |t|
    t.integer "nota"
    t.text "comentario"
    t.integer "shopping_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["shopping_id"], name: "index_avaliacao_shoppings_on_shopping_id"
    t.index ["user_id"], name: "index_avaliacao_shoppings_on_user_id"
  end

  create_table "feirantes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "shopping_id"
    t.string "categoria"
    t.index ["shopping_id"], name: "index_feirantes_on_shopping_id"
  end

  create_table "mensagems", force: :cascade do |t|
    t.string "mensagem"
    t.integer "user_id", null: false
    t.integer "feirante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feirante_id"], name: "index_mensagems_on_feirante_id"
    t.index ["user_id"], name: "index_mensagems_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.float "preco"
    t.integer "feirante_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feirante_id"], name: "index_produtos_on_feirante_id"
  end

  create_table "shoppings", force: :cascade do |t|
    t.string "nome"
    t.string "localizacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "senha"
    t.string "localizacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.integer "quantidade"
    t.integer "produto_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_wish_lists_on_produto_id"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "avaliacao_feirantes", "feirantes"
  add_foreign_key "avaliacao_feirantes", "users"
  add_foreign_key "avaliacao_shoppings", "shoppings"
  add_foreign_key "avaliacao_shoppings", "users"
  add_foreign_key "feirantes", "shoppings"
  add_foreign_key "mensagems", "feirantes"
  add_foreign_key "mensagems", "users"
  add_foreign_key "produtos", "feirantes"
  add_foreign_key "wish_lists", "produtos"
  add_foreign_key "wish_lists", "users"
end
