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

ActiveRecord::Schema.define(version: 20160612214446) do

  create_table "districts", force: :cascade do |t|
    t.string "description", limit: 255
    t.string "photo",       limit: 255
  end

  create_table "parking_lots", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "description",            limit: 255
    t.integer  "price",                  limit: 4
    t.integer  "spaces",                 limit: 4
    t.time     "opening_time"
    t.time     "closing_time"
    t.string   "photo",                  limit: 255
    t.integer  "slots",                  limit: 4
    t.boolean  "has_security_cameras"
    t.boolean  "has_security_alarms"
    t.boolean  "has_security_persons"
    t.boolean  "has_supermarkets_close"
    t.boolean  "has_restaurants_close"
    t.boolean  "has_cinemas_close"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id",                limit: 4
    t.integer  "district_id",            limit: 4
  end

  add_index "parking_lots", ["district_id"], name: "index_parking_lots_on_district_id", using: :btree
  add_index "parking_lots", ["user_id"], name: "index_parking_lots_on_user_id", using: :btree

  create_table "rents", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "total_minutes",  limit: 4
    t.float    "total_time",     limit: 24
    t.float    "total_price",    limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",        limit: 4
    t.integer  "parking_lot_id", limit: 4
  end

  add_index "rents", ["parking_lot_id"], name: "index_rents_on_parking_lot_id", using: :btree
  add_index "rents", ["user_id"], name: "index_rents_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255, default: "", null: false
    t.string   "lastname",               limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "parking_lots", "districts"
  add_foreign_key "parking_lots", "users"
  add_foreign_key "rents", "parking_lots"
  add_foreign_key "rents", "users"
end
