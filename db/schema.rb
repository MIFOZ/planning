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

ActiveRecord::Schema.define(version: 20150503155400) do

  create_table "human_beans", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.boolean  "is_head"
    t.integer  "default_deputy"
    t.integer  "deputy_by_order"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "post_id"
  end

  add_index "human_beans", ["post_id"], name: "index_human_beans_on_post_id"

  create_table "plans", force: :cascade do |t|
    t.integer  "work_type"
    t.string   "workflow"
    t.integer  "workflow_section"
    t.integer  "work_id"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "state"
    t.integer  "created_by_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "human_bean_id"
  end

  add_index "posts", ["human_bean_id"], name: "index_posts_on_human_bean_id"

  create_table "structure_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "structure_type"
    t.string   "code"
    t.integer  "head_id"
    t.integer  "parent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
