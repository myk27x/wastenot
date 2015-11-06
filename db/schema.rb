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

ActiveRecord::Schema.define(version: 20151105204820) do

  create_table "donations", force: :cascade do |t|
    t.integer  "donor_id"
    t.string   "address"
    t.text     "instructions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "donors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "org_name"
    t.string   "street_address"
    t.string   "contact_name"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "receivers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "org_name"
    t.string   "street_address"
    t.string   "contact_name"
    t.string   "phone"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.boolean  "has_need"
    t.integer  "open"
    t.integer  "close"
    t.text     "delivery_instructions"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "transporters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cell_phone"
    t.integer  "open"
    t.integer  "close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
