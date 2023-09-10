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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_082753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "group_name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_stores", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_favorite_stores_on_store_id"
    t.index ["user_id"], name: "index_favorite_stores_on_user_id"
  end

  create_table "nordic_runes", force: :cascade do |t|
    t.string "name"
    t.string "meaning"
    t.string "latin_letters_transcription"
    t.string "normal_position"
    t.string "inverted_position"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score", limit: 2, null: false
    t.bigint "user_id"
    t.bigint "store_id"
    t.integer "place", limit: 2
    t.integer "rank", limit: 2
    t.integer "type", limit: 2
    t.datetime "scored_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_scores_on_store_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.bigint "company_id"
    t.bigint "prefecture_id"
    t.string "address", limit: 100
    t.string "phone_number", limit: 20
    t.string "business_hours", limit: 50
    t.string "url_path", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "to_tsvector('english'::regconfig, (name)::text)", name: "stores_idx", using: :gin
    t.index ["company_id"], name: "index_stores_on_company_id"
    t.index ["prefecture_id"], name: "index_stores_on_prefecture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 100, default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", limit: 50, default: "", null: false
    t.string "nickname", limit: 50, default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name", "email"], name: "index_users_on_name_and_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "favorite_stores", "stores"
  add_foreign_key "favorite_stores", "users"
  add_foreign_key "scores", "stores"
  add_foreign_key "scores", "users"
  add_foreign_key "stores", "companies"
  add_foreign_key "stores", "prefectures"
end
