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

ActiveRecord::Schema[7.0].define(version: 2022_07_08_151439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id", null: false
    t.integer "duration"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "albums_orders", force: :cascade do |t|
    t.integer "sub_total"
    t.integer "album_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id", null: false
    t.bigint "order_id", null: false
    t.index ["album_id"], name: "index_albums_orders_on_album_id"
    t.index ["order_id"], name: "index_albums_orders_on_order_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "death_date"
    t.text "biography"
  end

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "name"
    t.boolean "active_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "custom_email", unique: true
    t.index ["username"], name: "custom_username", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.date "date"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums_orders", "albums"
  add_foreign_key "albums_orders", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "songs", "albums"
end
