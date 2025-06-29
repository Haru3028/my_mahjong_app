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

ActiveRecord::Schema[8.0].define(version: 2025_06_20_123708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "match_results", force: :cascade do |t|
    t.string "user_name"
    t.integer "score"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_hands", force: :cascade do |t|
    t.jsonb "hand_data"
    t.integer "score"
    t.string "yaku_name"
    t.date "date"
    t.string "round_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "score_calculators", force: :cascade do |t|
    t.json "hand_tiles"
    t.integer "result_score"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
