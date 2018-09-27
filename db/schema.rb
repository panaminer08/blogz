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

ActiveRecord::Schema.define(version: 2018_09_26_224415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "intros", id: :serial, force: :cascade do |t|
    t.string "title", limit: 50
    t.string "content", limit: 200
    t.integer "user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 50
    t.string "firstname", limit: 50
    t.string "lastname", limit: 50
    t.string "password", limit: 50
    t.string "birthday", limit: 10
    t.string "email", limit: 50
  end

  add_foreign_key "intros", "users", name: "intros_user_id_fkey"
end