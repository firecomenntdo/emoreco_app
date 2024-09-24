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

ActiveRecord::Schema[7.0].define(version: 2024_09_23_090723) do
  create_table "emotion_lvs", charset: "utf8mb4", force: :cascade do |t|
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "negative_tag_relations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "negative_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["negative_id"], name: "index_negative_tag_relations_on_negative_id"
    t.index ["tag_id"], name: "index_negative_tag_relations_on_tag_id"
  end

  create_table "negatives", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "emotion_lv_id", null: false
    t.text "negative_context"
    t.integer "tag_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emotion_lv_id"], name: "index_negatives_on_emotion_lv_id"
    t.index ["user_id"], name: "index_negatives_on_user_id"
  end

  create_table "positive_tag_relations", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "positive_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["positive_id"], name: "index_positive_tag_relations_on_positive_id"
    t.index ["tag_id"], name: "index_positive_tag_relations_on_tag_id"
  end

  create_table "positives", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "emotion_lv_id", null: false
    t.text "positive_context"
    t.integer "tag_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emotion_lv_id"], name: "index_positives_on_emotion_lv_id"
    t.index ["user_id"], name: "index_positives_on_user_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "negatives", "emotion_lvs"
  add_foreign_key "negatives", "users"
  add_foreign_key "positive_tag_relations", "positives"
  add_foreign_key "positive_tag_relations", "tags"
  add_foreign_key "positives", "emotion_lvs"
  add_foreign_key "positives", "users"
  add_foreign_key "tags", "users"
end
