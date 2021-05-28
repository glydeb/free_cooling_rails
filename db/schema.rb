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

ActiveRecord::Schema.define(version: 2021_05_23_205532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "indoor_sensor_readings", force: :cascade do |t|
    t.datetime "timestamp"
    t.decimal "dry_bulb"
    t.decimal "rh"
    t.bigint "indoor_sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["indoor_sensor_id"], name: "index_indoor_sensor_readings_on_indoor_sensor_id"
  end

  create_table "indoor_sensors", force: :cascade do |t|
    t.string "device_id"
    t.string "device_hash"
    t.bigint "location_id", null: false
    t.string "access_token"
    t.string "name"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_indoor_sensors_on_account_id"
    t.index ["location_id"], name: "index_indoor_sensors_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.boolean "alertable"
    t.integer "enable_alert_at_mins_after_midnight"
    t.integer "disable_alert_at_mins_after_midnight"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "timestamp"
    t.boolean "free_cooling_available"
    t.bigint "indoor_sensor_id", null: false
    t.bigint "weather_reading_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["indoor_sensor_id"], name: "index_recommendations_on_indoor_sensor_id"
    t.index ["weather_reading_id"], name: "index_recommendations_on_weather_reading_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weather_readings", force: :cascade do |t|
    t.datetime "timestamp"
    t.decimal "dry_bulb"
    t.decimal "rh"
    t.decimal "precip_chance_60"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_weather_readings_on_location_id"
  end

  add_foreign_key "indoor_sensor_readings", "indoor_sensors"
  add_foreign_key "indoor_sensors", "accounts"
  add_foreign_key "indoor_sensors", "locations"
  add_foreign_key "phones", "users"
  add_foreign_key "recommendations", "indoor_sensors"
  add_foreign_key "recommendations", "weather_readings"
  add_foreign_key "users", "accounts"
  add_foreign_key "weather_readings", "locations"
end
