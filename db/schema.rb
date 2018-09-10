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

ActiveRecord::Schema.define(version: 20180909122824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "back_phones", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "checked_out_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.decimal  "total",           precision: 12, scale: 3
    t.integer  "order_status_id"
  end

  add_index "carts", ["order_status_id"], name: "index_carts_on_order_status_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "rang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_url"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "phone_one"
    t.string   "phone_two"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "status",      default: "Показать"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_url"
  end

  create_table "data_products", force: :cascade do |t|
    t.string   "file_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "letters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "email"
    t.datetime "checked_out_at"
    t.string   "status",         default: "Новое"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "quantity",                             default: 1
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "cart_id"
  end

  add_index "order_items", ["cart_id"], name: "index_order_items_on_cart_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "order_status_id"
    t.integer  "user_id"
    t.decimal  "total",           precision: 12, scale: 3
    t.string   "delivery"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "phone"
    t.text     "description"
    t.string   "email"
    t.string   "status"
    t.text     "data"
    t.string   "payment_status",                           default: "Неоплаченный"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree

  create_table "pod_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.integer  "rang"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "pod_categories", ["slug"], name: "index_pod_categories_on_slug", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slug"
    t.string   "shot_description"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "prices", force: :cascade do |t|
    t.string   "price_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "status",     default: "Загружен"
  end

  create_table "product_images", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.integer  "rang"
    t.integer  "pod_category_id"
    t.integer  "category_id"
    t.string   "status",                                  default: "В наличие"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "slug"
    t.decimal  "price",           precision: 8, scale: 2
    t.integer  "identif"
  end

  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_id"
    t.string   "status",      default: "Скрыть"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "status",      default: "Показать"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "slug"
  end

  add_index "services", ["slug"], name: "index_services_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "phone"
    t.string   "name"
    t.boolean  "send_password"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
