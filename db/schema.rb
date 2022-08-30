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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_151642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.string "gratitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diary_rewards", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_diary_rewards_on_diary_id"
    t.index ["reward_id"], name: "index_diary_rewards_on_reward_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "content"
    t.bigint "diary_id", null: false
    t.string "title"
    t.integer "rating"
    t.boolean "principal"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_moods_on_diary_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "content_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "doctor", default: false
    t.boolean "moods_visibility"
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_users_on_doctor_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "diaries", "users"
  add_foreign_key "diary_rewards", "diaries"
  add_foreign_key "diary_rewards", "rewards"
  add_foreign_key "moods", "diaries"
  add_foreign_key "users", "users", column: "doctor_id"
end
