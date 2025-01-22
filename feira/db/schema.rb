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

ActiveRecord::Schema[8.0].define(version: 2025_01_22_193305) do
  create_table "administradors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.integer "nota"
    t.string "comentario"
    t.integer "user_id", null: false
    t.integer "produto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_avaliacaos_on_produto_id"
    t.index ["user_id"], name: "index_avaliacaos_on_user_id"
  end

  create_table "feirantes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.string "localizacao"
    t.string "sobre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historico_de_compras", force: :cascade do |t|
    t.integer "quantidade"
    t.integer "user_id", null: false
    t.integer "produto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_historico_de_compras_on_produto_id"
    t.index ["user_id"], name: "index_historico_de_compras_on_user_id"
  end

  create_table "mensagems", force: :cascade do |t|
    t.text "mensagem"
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

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha"
    t.string "localizacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "avaliacaos", "produtos"
  add_foreign_key "avaliacaos", "users"
  add_foreign_key "historico_de_compras", "produtos"
  add_foreign_key "historico_de_compras", "users"
  add_foreign_key "mensagems", "feirantes"
  add_foreign_key "mensagems", "users"
  add_foreign_key "produtos", "feirantes"
end
