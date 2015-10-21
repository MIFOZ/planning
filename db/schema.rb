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

ActiveRecord::Schema.define(version: 20150811174406) do

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
    t.integer  "branch_id"
  end

  add_index "human_beans", ["branch_id"], name: "index_human_beans_on_branch_id"
  add_index "human_beans", ["post_id"], name: "index_human_beans_on_post_id"

  create_table "plans", force: :cascade do |t|
    t.integer  "work_type",                 null: false
    t.integer  "workflow_id",               null: false
    t.integer  "order_id"
    t.integer  "project_id"
    t.string   "title",                     null: false
    t.integer  "created_by_id",             null: false
    t.integer  "state",         default: 0
    t.string   "commentary",                null: false
    t.datetime "creation_date",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "plans", ["created_by_id"], name: "index_plans_on_created_by_id"
  add_index "plans", ["order_id"], name: "index_plans_on_order_id"
  add_index "plans", ["project_id"], name: "index_plans_on_project_id"
  add_index "plans", ["workflow_id"], name: "index_plans_on_workflow_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "human_bean_id"
  end

  add_index "posts", ["human_bean_id"], name: "index_posts_on_human_bean_id"

  create_table "projects", force: :cascade do |t|
    t.string   "code",                  null: false
    t.string   "title",                 null: false
    t.integer  "manager_id",            null: false
    t.integer  "exec_id",               null: false
    t.string   "openning_order_number"
    t.date     "openning_order_date"
    t.string   "closure_act_number"
    t.date     "closure_act_date"
    t.date     "completion_date"
    t.integer  "workflow_id",           null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "projects", ["exec_id"], name: "index_projects_on_exec_id"
  add_index "projects", ["manager_id"], name: "index_projects_on_manager_id"
  add_index "projects", ["workflow_id"], name: "index_projects_on_workflow_id"

  create_table "structure_units", force: :cascade do |t|
    t.string   "name"
    t.integer  "structure_type"
    t.string   "code"
    t.integer  "head_id"
    t.integer  "parent_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title",                           null: false
    t.integer  "plan_id",                         null: false
    t.integer  "parent_task_id"
    t.integer  "idx",                             null: false
    t.integer  "labor_input_planned",             null: false
    t.float    "duration_planned",                null: false
    t.integer  "exec_id",                         null: false
    t.date     "begin_planned",                   null: false
    t.date     "end_planned",                     null: false
    t.integer  "state",                           null: false
    t.integer  "completeness",                    null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "prio",                default: 0, null: false
    t.integer  "labor_input_actual"
    t.float    "duration_actual"
    t.date     "begin_actual"
    t.date     "end_actual"
  end

  add_index "tasks", ["exec_id"], name: "index_tasks_on_exec_id"
  add_index "tasks", ["parent_task_id"], name: "index_tasks_on_parent_task_id"
  add_index "tasks", ["plan_id"], name: "index_tasks_on_plan_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "human_bean_id"
    t.string   "password_hash"
  end

  add_index "users", ["human_bean_id"], name: "index_users_on_human_bean_id"

  create_table "workflows", force: :cascade do |t|
    t.integer  "idx",         null: false
    t.string   "title",       null: false
    t.string   "short_title", null: false
    t.integer  "manager_id",  null: false
    t.integer  "exec_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workflows", ["exec_id"], name: "index_workflows_on_exec_id"
  add_index "workflows", ["manager_id"], name: "index_workflows_on_manager_id"

end
