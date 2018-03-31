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

ActiveRecord::Schema.define(version: 20180329084306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_books", force: :cascade do |t|
    t.bigint "visitor_id"
    t.string "name"
    t.string "mobile"
    t.string "province"
    t.string "city"
    t.string "district"
    t.string "detail_address"
    t.jsonb "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_address_books_on_visitor_id"
  end

  create_table "catalog_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", null: false
    t.integer "descendant_id", null: false
    t.integer "generations", null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "catalog_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "catalog_desc_idx"
  end

  create_table "catalogs", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_catalogs_on_parent_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "amount"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "visitor_id"
    t.string "code"
    t.integer "price"
    t.string "status"
    t.jsonb "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_orders_on_visitor_id"
  end

  create_table "product_dimensions", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.string "value"
    t.integer "price"
    t.integer "stock"
    t.string "image"
    t.jsonb "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_dimensions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "images", array: true
    t.string "description"
    t.text "content"
    t.jsonb "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "catalog_id"
    t.index ["catalog_id"], name: "index_products_on_catalog_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "price"
    t.integer "amount"
    t.bigint "visitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_carts_on_product_id"
    t.index ["visitor_id"], name: "index_shopping_carts_on_visitor_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "uid"
    t.string "nickname"
    t.string "headshot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wxlite_settings", force: :cascade do |t|
    t.string "banners", array: true
    t.integer "delivery_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "address_books", "visitors"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "visitors"
  add_foreign_key "product_dimensions", "products"
  add_foreign_key "products", "catalogs"
  add_foreign_key "shopping_carts", "products"
  add_foreign_key "shopping_carts", "visitors"
end
