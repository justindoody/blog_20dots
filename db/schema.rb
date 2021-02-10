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

ActiveRecord::Schema.define(version: 2014_11_21_201007) do

  create_table "images", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["post_id"], name: "index_images_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", limit: 255
    t.text "post"
    t.string "cover_photo", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug", limit: 255
    t.boolean "draft", default: true
    t.datetime "published_at"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
