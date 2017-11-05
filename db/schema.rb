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

ActiveRecord::Schema.define(version: 20171104133645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "seller_profile_id"
    t.string "name"
    t.text "description"
    t.text "image_data"
    t.text "allergies"
    t.boolean "vegetarian"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_profile_id"], name: "index_items_on_seller_profile_id"
  end

  create_table "listings", force: :cascade do |t|
    t.date "date"
    t.time "open"
    t.time "close"
    t.bigint "item_id"
    t.integer "quantity"
    t.bigint "seller_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_listings_on_item_id"
    t.index ["seller_profile_id"], name: "index_listings_on_seller_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "street_address"
    t.string "suburb"
    t.string "state"
    t.string "temp_street_address"
    t.string "temp_suburb"
    t.string "temp_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "seller_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "shop_name"
    t.text "shop_photo_data"
    t.text "shop_description"
    t.text "user_photo_data"
    t.string "cuisine_type"
    t.integer "delivery_km"
    t.integer "delivery_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_seller_profiles_on_user_id"
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

  add_foreign_key "items", "seller_profiles"
  add_foreign_key "listings", "items"
  add_foreign_key "listings", "seller_profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "seller_profiles", "users"
end
