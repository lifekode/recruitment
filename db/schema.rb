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

ActiveRecord::Schema.define(version: 20180404135642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developer_languages", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "language_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["developer_id"], name: "index_developer_languages_on_developer_id", using: :btree
    t.index ["language_id"], name: "index_developer_languages_on_language_id", using: :btree
  end

  create_table "developer_skills", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "programming_language_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["developer_id"], name: "index_developer_skills_on_developer_id", using: :btree
    t.index ["programming_language_id"], name: "index_developer_skills_on_programming_language_id", using: :btree
  end

  create_table "developers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_developers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "developer_languages", "developers"
  add_foreign_key "developer_languages", "languages"
  add_foreign_key "developer_skills", "developers"
  add_foreign_key "developer_skills", "programming_languages"
end
