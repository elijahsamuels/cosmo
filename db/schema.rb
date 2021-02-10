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

ActiveRecord::Schema.define(version: 2021_02_09_200436) do

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.string "mailing_address_1"
    t.string "mailing_address_2"
    t.string "mailing_city"
    t.integer "mailing_zip"
    t.string "mailing_state"
    t.string "url"
    t.string "email"
    t.string "phone", limit: 15
    t.text "description"
    t.string "ein"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_users", id: false, force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "job_start_datetime"
    t.datetime "job_end_datetime"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.string "status", default: "Inquiry"
    t.text "description"
    t.integer "total_amount"
    t.integer "amount_paid"
    t.integer "balance"
    t.integer "tax_rate"
    t.datetime "deposit_date"
    t.datetime "paid_date"
    t.datetime "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.integer "client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.integer "business_id"
    t.integer "job_id"
    t.integer "admin_id"
    t.integer "client_id"
    t.integer "contractor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_payments_on_admin_id"
    t.index ["business_id"], name: "index_payments_on_business_id"
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["contractor_id"], name: "index_payments_on_contractor_id"
    t.index ["job_id"], name: "index_payments_on_job_id"
  end

  create_table "user_relationships", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "contractor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "password_digest"
    t.string "last_name"
    t.string "phone", limit: 15
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.integer "zip"
    t.string "state"
    t.string "ssn"
    t.boolean "admin", default: false
    t.boolean "client", default: false
    t.boolean "contractor", default: false
    t.integer "admin_id"
    t.integer "client_id"
    t.integer "contractor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "hidden", default: false
    t.index ["admin_id"], name: "index_users_on_admin_id"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["contractor_id"], name: "index_users_on_contractor_id"
  end

  add_foreign_key "payments", "business"
  add_foreign_key "payments", "jobs"
  add_foreign_key "payments", "users", column: "admin_id"
  add_foreign_key "payments", "users", column: "client_id"
  add_foreign_key "payments", "users", column: "contractor_id"
  add_foreign_key "users", "users", column: "admin_id"
  add_foreign_key "users", "users", column: "client_id"
  add_foreign_key "users", "users", column: "contractor_id"
end
