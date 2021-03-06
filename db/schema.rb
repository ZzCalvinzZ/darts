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

ActiveRecord::Schema.define(version: 20141005133644) do

  create_table "games", force: true do |t|
    t.integer  "round_count",          default: 0
    t.integer  "player_1_total_score", default: 0
    t.integer  "player_2_total_score", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_users", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "historical_scores", force: true do |t|
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "historical_scores", ["user_id"], name: "index_user_id"

  create_table "users", force: true do |t|
    t.integer  "extension"
    t.string   "name"
    t.string   "email"
    t.integer  "average_score",      default: 0
    t.boolean  "is_star_player",     default: false
    t.integer  "wins",               default: 0
    t.integer  "losses",             default: 0
    t.integer  "draws",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_game_score", default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
