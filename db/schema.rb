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

ActiveRecord::Schema[7.0].define(version: 2022_10_12_194425) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.bigint "comic_id"
    t.bigint "character_id"
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_characters_on_comic_id"
  end

  create_table "comics", force: :cascade do |t|
    t.bigint "serie_id"
    t.bigint "comic_id"
    t.string "title"
    t.string "description"
    t.string "image_url"
    t.string "isbn"
    t.integer "page_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_comics_on_serie_id"
  end

  create_table "creators", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "first_name"
    t.string "last_name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "serie_id"
    t.string "title"
    t.text "description"
    t.integer "start_year"
    t.integer "end_year"
    t.string "image_url"
    t.string "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_series_on_creator_id"
  end

end
