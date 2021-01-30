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

ActiveRecord::Schema.define(version: 2021_01_24_082454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "name"], name: "index_categories_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "email"], name: "index_customers_on_user_id_and_email", unique: true
    t.index ["user_id", "name"], name: "index_customers_on_user_id_and_name", unique: true
    t.index ["user_id", "phone"], name: "index_customers_on_user_id_and_phone", unique: true
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "item_service_orders", force: :cascade do |t|
    t.integer "service_order_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity", null: false
    t.decimal "purchase_price", null: false
    t.decimal "sale_price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_item_service_orders_on_item_id"
    t.index ["service_order_id"], name: "index_item_service_orders_on_service_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "item_type", null: false
    t.string "description", null: false
    t.decimal "purchase_price", null: false
    t.decimal "sale_price", null: false
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["user_id", "name"], name: "index_items_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "service_orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "customer_id", null: false
    t.string "name", null: false
    t.string "status", null: false
    t.string "extra_information"
    t.date "accomplishment_date"
    t.date "delivery_date"
    t.decimal "discount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_service_orders_on_customer_id"
    t.index ["user_id"], name: "index_service_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
