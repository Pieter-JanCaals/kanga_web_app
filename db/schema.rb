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


ActiveRecord::Schema.define(version: 2019_02_27_195306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_drinks", force: :cascade do |t|
    t.bigint "drink_id"
    t.bigint "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_drinks_on_bar_id"
    t.index ["drink_id"], name: "index_bar_drinks_on_drink_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bars_on_event_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.integer "prep_time"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["category_id"], name: "index_drinks_on_category_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "photo"
  end

  create_table "order_drinks", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "drink_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", default: 0
    t.index ["drink_id"], name: "index_order_drinks_on_drink_id"
    t.index ["order_id"], name: "index_order_drinks_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status", default: "pending"
    t.string "qr_code"
    t.bigint "bar_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tip"
    t.index ["bar_id"], name: "index_orders_on_bar_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bar_drinks", "bars"
  add_foreign_key "bar_drinks", "drinks"
  add_foreign_key "bars", "events"
  add_foreign_key "drinks", "categories"
  add_foreign_key "order_drinks", "drinks"
  add_foreign_key "order_drinks", "orders"
  add_foreign_key "orders", "bars"
  add_foreign_key "orders", "users"
end
