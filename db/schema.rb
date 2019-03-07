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

ActiveRecord::Schema.define(version: 2018_12_31_153527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "periods", force: :cascade do |t|
    t.date "starts_at"
    t.date "ends_at"
    t.bigint "schedule_id"
    t.index ["schedule_id"], name: "index_periods_on_schedule_id"
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "project_status_id"
    t.index ["project_status_id"], name: "index_projects_on_project_status_id"
  end

  create_table "resource_tags", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "tag_id"
    t.index ["resource_id"], name: "index_resource_tags_on_resource_id"
    t.index ["tag_id"], name: "index_resource_tags_on_tag_id"
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.bigint "role_id"
    t.bigint "resource_type_id"
    t.index ["resource_type_id"], name: "index_resources_on_resource_type_id"
    t.index ["role_id"], name: "index_resources_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "schedule_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "resource_id"
    t.bigint "schedule_type_id"
    t.index ["project_id"], name: "index_schedules_on_project_id"
    t.index ["resource_id"], name: "index_schedules_on_resource_id"
    t.index ["schedule_type_id"], name: "index_schedules_on_schedule_type_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "periods", "schedules"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "resource_tags", "resources"
  add_foreign_key "resource_tags", "tags"
  add_foreign_key "resources", "resource_types"
  add_foreign_key "resources", "roles"
  add_foreign_key "schedules", "projects"
  add_foreign_key "schedules", "resources"
  add_foreign_key "schedules", "schedule_types"
end
