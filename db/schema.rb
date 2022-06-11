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

ActiveRecord::Schema.define(version: 2022_06_11_042432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "whiskey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
    t.index ["whiskey_id"], name: "index_bookmarks_on_whiskey_id"
  end

  create_table "drink_ways", force: :cascade do |t|
    t.string "name", null: false
    t.text "explanation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "how_to_make_url", null: false
    t.string "english_name", null: false
    t.string "image"
    t.index ["english_name"], name: "index_drink_ways_on_english_name", unique: true
    t.index ["explanation"], name: "index_drink_ways_on_explanation", unique: true
    t.index ["how_to_make_url"], name: "index_drink_ways_on_how_to_make_url", unique: true
    t.index ["name"], name: "index_drink_ways_on_name", unique: true
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name", null: false
    t.string "detail", null: false
    t.integer "group", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "detail"], name: "index_flavors_on_name_and_detail", unique: true
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "english_name", null: false
    t.string "image"
    t.index ["english_name"], name: "index_snacks_on_english_name", unique: true
    t.index ["name", "description"], name: "index_snacks_on_name_and_description", unique: true
  end

  create_table "tasting_note_flavors", force: :cascade do |t|
    t.bigint "tasting_note_id", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavor_id"], name: "index_tasting_note_flavors_on_flavor_id"
    t.index ["tasting_note_id"], name: "index_tasting_note_flavors_on_tasting_note_id"
  end

  create_table "tasting_notes", force: :cascade do |t|
    t.string "comment", null: false
    t.bigint "user_id", null: false
    t.bigint "drink_way_id", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "whiskey_id", null: false
    t.index ["drink_way_id"], name: "index_tasting_notes_on_drink_way_id"
    t.index ["flavor_id"], name: "index_tasting_notes_on_flavor_id"
    t.index ["user_id"], name: "index_tasting_notes_on_user_id"
    t.index ["whiskey_id"], name: "index_tasting_notes_on_whiskey_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "ユーザー", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "best_bottle"
    t.string "avatar"
  end

  create_table "whiskey_flavors", force: :cascade do |t|
    t.bigint "whiskey_id", null: false
    t.bigint "flavor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flavor_id"], name: "index_whiskey_flavors_on_flavor_id"
    t.index ["whiskey_id"], name: "index_whiskey_flavors_on_whiskey_id"
  end

  create_table "whiskeys", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "mouth_feel", default: 2, null: false
    t.integer "flavor_strength", default: 2, null: false
    t.integer "rarity", default: 2, null: false
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "drink_way_id"
    t.bigint "snack_id"
    t.text "amazon_link", null: false
    t.string "amazon_image_link", null: false
    t.string "amazon_impression_link", null: false
    t.integer "region", default: 0, null: false
    t.integer "processing", default: 0, null: false
    t.index ["amazon_image_link"], name: "index_whiskeys_on_amazon_image_link", unique: true
    t.index ["amazon_impression_link"], name: "index_whiskeys_on_amazon_impression_link", unique: true
    t.index ["amazon_link"], name: "index_whiskeys_on_amazon_link", unique: true
    t.index ["drink_way_id"], name: "index_whiskeys_on_drink_way_id"
    t.index ["name"], name: "index_whiskeys_on_name", unique: true
    t.index ["snack_id"], name: "index_whiskeys_on_snack_id"
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "bookmarks", "whiskeys"
  add_foreign_key "tasting_note_flavors", "flavors"
  add_foreign_key "tasting_note_flavors", "tasting_notes"
  add_foreign_key "tasting_notes", "drink_ways"
  add_foreign_key "tasting_notes", "flavors"
  add_foreign_key "tasting_notes", "users"
  add_foreign_key "tasting_notes", "whiskeys"
  add_foreign_key "whiskey_flavors", "flavors"
  add_foreign_key "whiskey_flavors", "whiskeys"
  add_foreign_key "whiskeys", "drink_ways"
  add_foreign_key "whiskeys", "snacks"
end
