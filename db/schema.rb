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

ActiveRecord::Schema[8.1].define(version: 2026_07_09_165316) do
  create_table "devices", force: :cascade do |t|
    t.date "acquired_at"
    t.string "asset_number"
    t.datetime "created_at", precision: nil
    t.boolean "is_discarded", default: false
    t.string "item"
    t.integer "location_id"
    t.text "notes"
    t.integer "person_id"
    t.datetime "updated_at", precision: nil
    t.index ["location_id"], name: "index_devices_on_location_id"
    t.index ["person_id"], name: "index_devices_on_person_id"
  end

  create_table "licenses", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.integer "device_id"
    t.string "item"
    t.string "key"
    t.text "notes"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["device_id"], name: "index_licenses_on_device_id"
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "name"
    t.text "notes"
    t.datetime "updated_at", precision: nil
  end

  create_table "people", id: :integer, default: nil, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "current_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at", precision: nil
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "remember_created_at", precision: nil
    t.datetime "reset_password_sent_at", precision: nil
    t.string "reset_password_token"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "updated_at", precision: nil
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "licenses", "devices"
end
