# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_20_170059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blockage_customers", force: :cascade do |t|
    t.bigint "blockage_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blockage_id"], name: "index_blockage_customers_on_blockage_id"
    t.index ["customer_id"], name: "index_blockage_customers_on_customer_id"
  end

  create_table "blockages", force: :cascade do |t|
    t.bigint "customer_id"
    t.datetime "data_hora_inicio"
    t.datetime "data_hora_final"
    t.string "link_youtube"
    t.string "link_vimeo"
    t.string "link_imagem"
    t.boolean "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "url_stream_id"
    t.index ["customer_id"], name: "index_blockages_on_customer_id"
    t.index ["url_stream_id"], name: "index_blockages_on_url_stream_id"
    t.index ["user_id"], name: "index_blockages_on_user_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "customers", force: :cascade do |t|
    t.string "razao_social"
    t.string "nome_fantasia"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.string "inscricao_municipal"
    t.string "endereco"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.string "estado"
    t.string "cidade"
    t.string "site"
    t.string "email"
    t.string "telefone"
    t.string "campo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "membro_clientes", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "telefone"
    t.boolean "status"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_membro_clientes_on_customer_id"
    t.index ["email"], name: "index_membro_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_membro_clientes_on_reset_password_token", unique: true
  end

  create_table "permissions", force: :cascade do |t|
    t.string "description"
    t.string "object_type"
    t.string "action_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "action_name"], name: "index_permissions_on_object_type_and_action_name", unique: true
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.index ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", unique: true
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "title"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string "link"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "url_stream_customers", force: :cascade do |t|
    t.bigint "url_stream_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_url_stream_customers_on_customer_id"
    t.index ["url_stream_id"], name: "index_url_stream_customers_on_url_stream_id"
  end

  create_table "url_streams", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "url"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_url_streams_on_customer_id"
  end

  create_table "user_customers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_user_customers_on_customer_id"
    t.index ["user_id"], name: "index_user_customers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["is_active"], name: "index_users_on_is_active"
    t.index ["is_admin"], name: "index_users_on_is_admin"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "video_access_tokens", force: :cascade do |t|
    t.string "token"
    t.integer "membro_cliente_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blockage_customers", "blockages"
  add_foreign_key "blockage_customers", "customers"
  add_foreign_key "blockages", "customers"
  add_foreign_key "blockages", "url_streams"
  add_foreign_key "blockages", "users"
  add_foreign_key "membro_clientes", "customers"
  add_foreign_key "permissions_roles", "permissions"
  add_foreign_key "permissions_roles", "roles"
  add_foreign_key "url_stream_customers", "customers"
  add_foreign_key "url_stream_customers", "url_streams"
  add_foreign_key "url_streams", "customers"
  add_foreign_key "user_customers", "customers"
  add_foreign_key "user_customers", "users"
  add_foreign_key "users", "roles"
end
