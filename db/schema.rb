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

ActiveRecord::Schema.define(version: 20150420174019) do

  create_table "devices", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "dev_type",   limit: 255
    t.integer  "userid",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sfiles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "userid",     limit: 4
    t.integer  "devid",      limit: 4
    t.string   "syncfile",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "firstname",       limit: 255
    t.string   "lastname",        limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest", limit: 255
    t.boolean  "admin",           limit: 1,   default: false
    t.string   "personal_page",   limit: 255
  end

end
