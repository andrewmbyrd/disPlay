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

ActiveRecord::Schema.define(version: 20170606214435) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_purchase_id"
    t.string   "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["game_purchase_id"], name: "index_comments_on_game_purchase_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "game_purchase_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "commentee"
    t.index ["game_purchase_id"], name: "index_events_on_game_purchase_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "game_purchases", force: :cascade do |t|
    t.integer  "library_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "review"
    t.integer  "rating"
    t.index ["game_id"], name: "index_game_purchases_on_game_id"
    t.index ["library_id"], name: "index_game_purchases_on_library_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "genre"
    t.integer  "release_year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "system_id"
    t.string   "description"
    t.string   "img_url"
    t.index ["system_id"], name: "index_games_on_system_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "style"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_publications_on_company_id"
    t.index ["game_id"], name: "index_publications_on_game_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "follower_id"
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "releases", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_releases_on_game_id"
    t.index ["system_id"], name: "index_releases_on_system_id"
  end

  create_table "system_purchases", force: :cascade do |t|
    t.integer  "library_id"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_system_purchases_on_library_id"
    t.index ["system_id"], name: "index_system_purchases_on_system_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string   "name"
    t.integer  "release_year"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.string   "description"
    t.string   "img_url"
    t.index ["company_id"], name: "index_systems_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
