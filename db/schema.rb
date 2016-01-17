# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160116172943) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float    "total",            default: 0.0
    t.float    "shipping_fee",     default: 0.0
    t.float    "subtotal",         default: 0.0
    t.string   "shipping_address"
    t.string   "bill_address"
    t.string   "shipping_phone"
    t.string   "shipping_name"
    t.string   "bill_phone"
    t.string   "bill_name"
    t.integer  "order_state_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.text     "special_note"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.integer  "rating",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_category_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "product_attributes", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_child_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "child_product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "product_child_products", ["child_product_id"], name: "index_product_child_products_on_child_product_id"
  add_index "product_child_products", ["product_id"], name: "index_product_child_products_on_product_id"

  create_table "product_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "body"
    t.integer  "rating",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_product_variation_value_ships", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "product_variation_value_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "product_variation_values", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_variation_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "product_variations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "brief"
    t.text     "description"
    t.float    "list_price"
    t.float    "sale_price"
    t.integer  "stock",             default: 1
    t.string   "sku"
    t.float    "weight"
    t.float    "height"
    t.float    "length"
    t.float    "width"
    t.boolean  "is_multi_option",   default: false
    t.boolean  "visible",           default: true
    t.boolean  "available",         default: true
    t.integer  "brand_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_child_product",  default: false
    t.integer  "parent_product_id"
    t.boolean  "stock_active",      default: false
    t.integer  "feature_image_id"
  end

  create_table "user_cart_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "price"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "url"
    t.boolean  "is_read",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
