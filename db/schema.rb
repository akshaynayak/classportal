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

ActiveRecord::Schema.define(version: 20160221014138) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "conversations", force: true do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
  end

  create_table "courses", force: true do |t|
    t.string   "course_number"
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active"
    t.text     "notifications"
    t.text     "deadlines"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_number"], name: "index_courses_on_course_number", unique: true

  create_table "instructors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.boolean  "notification",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "user_course_histories", force: true do |t|
    t.boolean  "is_teaching"
    t.boolean  "is_enrolled"
    t.boolean  "has_requested_enrollment"
    t.string   "grade"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_courses", force: true do |t|
    t.boolean  "is_teaching"
    t.boolean  "is_enrolled"
    t.boolean  "has_requested_enrollment"
    t.string   "grade"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_archived",              default: false
  end

  add_index "user_courses", ["is_archived"], name: "index_user_courses_on_is_archived"

  create_table "user_courses_history", force: true do |t|
    t.boolean  "is_teaching"
    t.boolean  "is_enrolled"
    t.boolean  "has_requested_enrollment"
    t.string   "grade"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_admin"
    t.boolean  "is_instructor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
