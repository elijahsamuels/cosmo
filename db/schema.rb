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

ActiveRecord::Schema.define(version: 2021_01_28_175521) do

  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone", limit: 15
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone", limit: 15
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.integer "job_id"
    t.index ["admin_id"], name: "index_clients_on_admin_id"
    t.index ["job_id"], name: "index_clients_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "job_start_datetime"
    t.datetime "job_end_datetime"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.integer "client_id"
    t.text "description"
    t.index ["admin_id"], name: "index_jobs_on_admin_id"
    t.index ["client_id"], name: "index_jobs_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone", limit: 15
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.index ["admin_id"], name: "index_users_on_admin_id"
  end

end
