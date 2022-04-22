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

ActiveRecord::Schema[7.0].define(version: 2022_04_22_162202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_conversations_on_customer_id"
    t.index ["seller_id"], name: "index_conversations_on_seller_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "conversation_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["customer_id"], name: "index_messages_on_customer_id"
    t.index ["seller_id"], name: "index_messages_on_seller_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "quantity", null: false
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "price", null: false
    t.bigint "seller_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "stock", null: false
    t.string "uom", null: false
    t.integer "rank", default: 0
    t.string "category", null: false
    t.string "image"
    t.index ["seller_id"], name: "index_products_on_seller_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer "score", null: false
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_ranks_on_customer_id"
    t.index ["product_id"], name: "index_ranks_on_product_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "customer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", null: false
    t.index ["seller_id"], name: "index_stores_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "role", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conversations", "users", column: "customer_id"
  add_foreign_key "conversations", "users", column: "seller_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "customer_id"
  add_foreign_key "messages", "users", column: "seller_id"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users", column: "customer_id"
  add_foreign_key "products", "stores"
  add_foreign_key "products", "users", column: "seller_id"
  add_foreign_key "ranks", "products"
  add_foreign_key "ranks", "users", column: "customer_id"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users", column: "customer_id"
  add_foreign_key "stores", "users", column: "seller_id"
end
