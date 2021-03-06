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

ActiveRecord::Schema.define(version: 20180924150730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nav_title"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "homepage_feature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "portfolio_id"
    t.string "type"
    t.string "slug"
    t.index ["portfolio_id"], name: "index_projects_on_portfolio_id"
  end

  create_table "stills_project_images", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "stills_project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_stills_project_images_on_image_id"
    t.index ["stills_project_id"], name: "index_stills_project_images_on_stills_project_id"
  end

end
