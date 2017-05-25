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

ActiveRecord::Schema.define(version: 20170519101812) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_courses", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "category_id", null: false
    t.index ["course_id", "category_id"], name: "index_categories_courses_on_course_id_and_category_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "prerequisite"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "image"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "courses_locations", id: false, force: :cascade do |t|
    t.integer "course_id",   null: false
    t.integer "location_id", null: false
    t.index ["course_id", "location_id"], name: "index_courses_locations_on_course_id_and_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "building",   null: false
    t.integer  "level",      null: false
    t.integer  "room",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "users_id"
    t.integer  "ratings_id"
    t.boolean  "rated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratings_id"], name: "index_rates_on_ratings_id"
    t.index ["users_id"], name: "index_rates_on_users_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "likes"
    t.integer  "dislikes"
    t.integer  "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_id"], name: "index_ratings_on_courses_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
