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

ActiveRecord::Schema.define(version: 20150712011029) do

  create_table "clips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "instrument_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
    t.string   "genre"
    t.string   "title"
  end

  add_index "clips", ["instrument_id"], name: "index_clips_on_instrument_id"
  add_index "clips", ["user_id"], name: "index_clips_on_user_id"

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "genre_id"
  end

  add_index "genres_users", ["genre_id"], name: "index_genres_users_on_genre_id"
  add_index "genres_users", ["user_id"], name: "index_genres_users_on_user_id"

  create_table "influences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "influences", ["user_id"], name: "index_influences_on_user_id"

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "instrument_id"
  end

  add_index "instruments_users", ["instrument_id"], name: "index_instruments_users_on_instrument_id"
  add_index "instruments_users", ["user_id"], name: "index_instruments_users_on_user_id"

  create_table "user_searches", force: :cascade do |t|
    t.integer  "searcher_id"
    t.integer  "zipcode"
    t.boolean  "default_search"
    t.integer  "instrument_id"
    t.integer  "genre_id"
    t.text     "results"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.text     "description"
    t.integer  "zipcode"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

end
