# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_03_170805) do

  create_table "distribution_centers", charset: "latin1", force: :cascade do |t|
    t.string "address"
    t.float "latitude_location"
    t.float "longitude_location"
    t.float "total_space"
    t.float "available_space"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_schedules", charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "distribution_center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["distribution_center_id"], name: "index_time_schedules_on_distribution_center_id"
  end

  create_table "time_windows", charset: "latin1", force: :cascade do |t|
    t.datetime "beginning"
    t.datetime "ending"
    t.bigint "time_schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["time_schedule_id"], name: "index_time_windows_on_time_schedule_id"
  end

  add_foreign_key "time_schedules", "distribution_centers"
  add_foreign_key "time_windows", "time_schedules"
end
