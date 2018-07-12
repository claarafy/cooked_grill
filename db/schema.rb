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

ActiveRecord::Schema.define(version: 20180712215335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cooks", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance"
    t.string "first_name"
    t.string "profile_image"
    t.string "s3_profile_image"
    t.text "about_me"
    t.string "zip"
    t.string "default_pickup_address"
    t.string "phone_number"
    t.index ["email"], name: "index_cooks_on_email", unique: true
    t.index ["reset_password_token"], name: "index_cooks_on_reset_password_token", unique: true
  end

  create_table "meals", force: :cascade do |t|
    t.text "title"
    t.text "ingredients"
    t.datetime "availability_from"
    t.datetime "availability_to"
    t.string "images"
    t.string "location"
    t.string "tags"
    t.integer "meal_rating"
    t.bigint "cook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "meal_cost", precision: 8, scale: 2
    t.text "description"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.boolean "active"
    t.boolean "pickup_only"
    t.boolean "delivery_only"
    t.text "portion_info"
    t.boolean "family_deal"
    t.boolean "low_carb"
    t.index ["cook_id"], name: "index_meals_on_cook_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total"
    t.text "pickup_address"
    t.text "delivery_address"
    t.datetime "order_date"
    t.datetime "pickup_date"
    t.string "customer_phone"
    t.bigint "user_id"
    t.bigint "meal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_cost", precision: 8, scale: 2
    t.boolean "paid"
    t.decimal "cook_total"
    t.boolean "pickup"
    t.boolean "delivery"
    t.boolean "reviewed"
    t.bigint "review_id"
    t.decimal "delivery_fee"
    t.boolean "delivered"
    t.integer "driver_id"
    t.index ["meal_id"], name: "index_orders_on_meal_id"
    t.index ["review_id"], name: "index_orders_on_review_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meal_id"
    t.text "text"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["meal_id"], name: "index_reviews_on_meal_id"
    t.index ["order_id"], name: "index_reviews_on_order_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "zip"
    t.string "default_delivery_address"
    t.string "phone_number"
    t.decimal "driver_balance"
    t.boolean "driver"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meals", "cooks"
  add_foreign_key "orders", "meals"
  add_foreign_key "orders", "reviews"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "meals"
  add_foreign_key "reviews", "orders"
  add_foreign_key "reviews", "users"
end
