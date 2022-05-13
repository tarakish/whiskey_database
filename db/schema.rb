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

ActiveRecord::Schema.define(version: 2022_05_13_154911) do

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
    t.integer "feeling_to_whiskey_with_tongue", default: 2, null: false
    t.integer "flavor_strength", default: 2, null: false
    t.integer "rarity", default: 2, null: false
    t.integer "reasonable_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "drink_way_id"
    t.bigint "snack_id"
    t.index ["drink_way_id"], name: "index_whiskeys_on_drink_way_id"
    t.index ["name"], name: "index_whiskeys_on_name", unique: true
    t.index ["snack_id"], name: "index_whiskeys_on_snack_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "whiskey_flavors", "flavors"
  add_foreign_key "whiskey_flavors", "whiskeys"
  add_foreign_key "whiskeys", "drink_ways"
  add_foreign_key "whiskeys", "snacks"
end
