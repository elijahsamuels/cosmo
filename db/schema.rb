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

ActiveRecord::Schema.define(version: 2021_02_14_231852) do

  create_table "businesses", force: :cascade do |t|
    t.string "name", default: ""
    t.string "address_1", default: ""
    t.string "address_2", default: ""
    t.string "city", default: ""
    t.integer "zip", default: 0
    t.string "state", default: ""
    t.string "mailing_address_1", default: ""
    t.string "mailing_address_2", default: ""
    t.string "mailing_city", default: ""
    t.integer "mailing_zip", default: 0
    t.string "mailing_state", default: ""
    t.string "url", default: ""
    t.string "email", default: ""
    t.string "phone", limit: 15, default: ""
    t.text "description", default: ""
    t.string "ein", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "job_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date_invoice_sent", default: "2021-02-14 23:20:32"
    t.integer "invoice_amount", default: 0
    t.boolean "paid", default: false
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "job_start_datetime", default: "2021-02-14 23:20:32"
    t.datetime "job_end_datetime", default: "2001-01-01 01:00:00"
    t.string "address_1", default: ""
    t.string "address_2", default: ""
    t.string "city", default: ""
    t.integer "zip", default: 0
    t.string "state", default: ""
    t.string "status", default: "Inquiry"
    t.text "description", default: ""
    t.integer "total_amount", default: 0
    t.integer "amount_paid", default: 0
    t.integer "balance", default: 0
    t.integer "tax_rate", default: 0
    t.datetime "deposit_date", default: "2001-01-01 01:00:00"
    t.datetime "paid_date", default: "2001-01-01 01:00:00"
    t.datetime "due_date", default: "2001-01-01 01:00:00"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin_id"
    t.integer "client_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount", default: 0
    t.integer "business_id"
    t.integer "job_id"
    t.integer "admin_id"
    t.integer "client_id"
    t.integer "contractor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_type"
    t.index ["admin_id"], name: "index_payments_on_admin_id"
    t.index ["business_id"], name: "index_payments_on_business_id"
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["contractor_id"], name: "index_payments_on_contractor_id"
    t.index ["job_id"], name: "index_payments_on_job_id"
  end

  create_table "user_relationships", force: :cascade do |t|
    t.integer "client_id"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "contractor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: ""
    t.string "email", default: ""
    t.string "password_digest"
    t.string "last_name", default: ""
    t.string "phone", limit: 15, default: ""
    t.string "address_1", default: ""
    t.string "address_2", default: ""
    t.string "city", default: ""
    t.integer "zip", default: 0
    t.string "state", default: ""
    t.string "ssn", default: "0"
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

  add_foreign_key "users", "users", column: "admin_id"
  add_foreign_key "users", "users", column: "client_id"
  add_foreign_key "users", "users", column: "contractor_id"
end
