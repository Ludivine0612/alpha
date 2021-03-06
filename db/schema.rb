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

ActiveRecord::Schema.define(version: 2018_12_06_152618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["company_id"], name: "index_bookings_on_company_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "siret"
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.string "description"
    t.bigint "activity_id"
    t.bigint "booking_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_prestations_on_activity_id"
    t.index ["booking_id"], name: "index_prestations_on_booking_id"
    t.index ["job_id"], name: "index_prestations_on_job_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_skills_on_activity_id"
    t.index ["job_id"], name: "index_skills_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "address"
    t.string "phone_number"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "companies"
  add_foreign_key "bookings", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "users"
  add_foreign_key "prestations", "activities"
  add_foreign_key "prestations", "bookings"
  add_foreign_key "prestations", "jobs"
  add_foreign_key "skills", "activities"
  add_foreign_key "skills", "jobs"
end
