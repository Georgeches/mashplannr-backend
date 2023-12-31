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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_054234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email"
  end

  create_table "merchandisers", force: :cascade do |t|
    t.string "name"
    t.string "id_number"
    t.string "phone_number"
    t.string "vehicle_registration"
    t.string "status"
    t.string "email"
    t.string "profile_picture"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.string "products_ordered"
    t.date "date"
    t.bigint "merchandiser_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.integer "sale"
    t.index ["merchandiser_id"], name: "index_orders_on_merchandiser_id"
  end

  add_foreign_key "orders", "merchandisers"
end
