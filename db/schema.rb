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

ActiveRecord::Schema.define(version: 20191206212745) do

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vehicle_statuses", force: :cascade do |t|
    t.string "tire_pressure"
    t.string "battery_level"
    t.string "lidar_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vehicle_id"
    t.string "latitude"
    t.string "longitude"
    t.string "heading"
    t.string "occupancy"
    t.index ["vehicle_id"], name: "index_vehicle_statuses_on_vehicle_id"
  end

end
