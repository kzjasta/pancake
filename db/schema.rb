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

ActiveRecord::Schema.define(version: 20170322014335) do

  create_table "fixtures", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "date_time"
    t.text     "description"
    t.integer  "venue_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["away_team_id"], name: "index_fixtures_on_away_team_id"
    t.index ["home_team_id"], name: "index_fixtures_on_home_team_id"
    t.index ["user_id"], name: "index_fixtures_on_user_id"
    t.index ["venue_id"], name: "index_fixtures_on_venue_id"
  end

  create_table "match_sets", force: :cascade do |t|
    t.integer  "set_number"
    t.integer  "fixture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "home_score"
    t.integer  "away_score"
    t.integer  "touch_id"
    t.index ["fixture_id"], name: "index_match_sets_on_fixture_id"
    t.index ["touch_id"], name: "index_match_sets_on_touch_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "height"
    t.integer  "weight"
    t.string   "position"
    t.integer  "spike_reach"
    t.integer  "block_reach"
    t.string   "nationality"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "touches", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "position"
    t.string   "touch_type"
    t.string   "touch_result"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "team_id"
    t.integer  "match_set_id"
    t.index ["match_set_id"], name: "index_touches_on_match_set_id"
    t.index ["player_id"], name: "index_touches_on_player_id"
    t.index ["team_id"], name: "index_touches_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
