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

ActiveRecord::Schema.define(version: 20141004125459) do

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_1_round_score"
    t.integer  "player_1_total_score"
    t.integer  "player_2_round_score"
    t.integer  "player_2_total_score"
  end

  create_table "games_users", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.integer  "extension"
    t.string   "name"
    t.string   "email"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "average_score"
    t.boolean  "is_star_player"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
