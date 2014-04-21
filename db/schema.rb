# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140421215843) do

  create_table "admin_profiles", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_profiles", ["user_id"], name: "index_admin_profiles_on_user_id"

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructor_profiles", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructor_profiles", ["user_id"], name: "index_instructor_profiles_on_user_id"

  create_table "instructor_profiles_workshops", force: true do |t|
    t.integer  "instructor_profile_id"
    t.integer  "workshop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructor_profiles_workshops", ["instructor_profile_id", "workshop_id"], name: "rel_instructor_profiles_workshops", unique: true

  create_table "student_profiles", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_profiles", ["user_id"], name: "index_student_profiles_on_user_id"

  create_table "tracks", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks_workshops", force: true do |t|
    t.integer  "track_id"
    t.integer  "workshop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks_workshops", ["track_id", "workshop_id"], name: "rel_tracks_workshops", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password",                            null: false
    t.string   "salt",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.integer  "instructor_profile_id"
    t.integer  "student_profile_id"
    t.integer  "admin_profile_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "workshops", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "status"
    t.string   "banner"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
