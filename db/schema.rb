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

ActiveRecord::Schema[7.1].define(version: 2024_03_25_195350) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_chats_on_game_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_departments_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "increment_total_scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "group"
    t.string "stage"
    t.string "tournament"
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.datetime "date"
    t.integer "home_team_result"
    t.integer "away_team_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_matches_on_away_team_id"
    t.index ["home_team_id"], name: "index_matches_on_home_team_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pronostics", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "user_id", null: false
    t.integer "home_team_prono"
    t.integer "away_team_prono"
    t.bigint "game_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_pronostics_on_game_id"
    t.index ["match_id"], name: "index_pronostics_on_match_id"
    t.index ["user_id"], name: "index_pronostics_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo"
    t.string "department"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.integer "total_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_users_games_on_department_id"
    t.index ["game_id"], name: "index_users_games_on_game_id"
    t.index ["user_id"], name: "index_users_games_on_user_id"
  end

  add_foreign_key "chats", "games"
  add_foreign_key "departments", "games"
  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "pronostics", "games"
  add_foreign_key "pronostics", "matches"
  add_foreign_key "pronostics", "users"
  add_foreign_key "users_games", "departments"
  add_foreign_key "users_games", "games"
  add_foreign_key "users_games", "users"
end
