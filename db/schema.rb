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

ActiveRecord::Schema.define(version: 2022_06_05_073741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.index ["english_name"], name: "index_drink_ways_on_english_name", unique: true
    t.index ["explanation"], name: "index_drink_ways_on_explanation", unique: true
    t.index ["how_to_make_url"], name: "index_drink_ways_on_how_to_make_url", unique: true
    t.index ["name"], name: "index_drink_ways_on_name", unique: true
  end

  create_table "flavors", force: :cascade do |t|
    t.string "name", null: false
    t.string "detail", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "group"
    t.index ["name", "detail"], name: "index_flavors_on_name_and_detail", unique: true
  end

  create_table "snacks", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "english_name", null: false
    t.index ["english_name"], name: "index_snacks_on_english_name", unique: true
    t.index ["name", "description"], name: "index_snacks_on_name_and_description", unique: true
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
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", default: "ユーザー", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "best_bottle"
    t.index ["email"], name: "index_users_on_email", unique: true
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
    t.string "region", null: false
    t.text "amazon_link", null: false
    t.string "amazon_image_link", null: false
    t.string "amazon_impression_link", null: false
    t.index ["amazon_image_link"], name: "index_whiskeys_on_amazon_image_link", unique: true
    t.index ["amazon_impression_link"], name: "index_whiskeys_on_amazon_impression_link", unique: true
    t.index ["amazon_link"], name: "index_whiskeys_on_amazon_link", unique: true
    t.index ["drink_way_id"], name: "index_whiskeys_on_drink_way_id"
    t.index ["name"], name: "index_whiskeys_on_name", unique: true
    t.index ["snack_id"], name: "index_whiskeys_on_snack_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "bookmarks", "whiskeys"
  add_foreign_key "tasting_notes", "drink_ways"
  add_foreign_key "tasting_notes", "flavors"
  add_foreign_key "tasting_notes", "users"
  add_foreign_key "tasting_notes", "whiskeys"
  add_foreign_key "whiskey_flavors", "flavors"
  add_foreign_key "whiskey_flavors", "whiskeys"
  add_foreign_key "whiskeys", "drink_ways"
  add_foreign_key "whiskeys", "snacks"
end
