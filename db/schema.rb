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

ActiveRecord::Schema.define(version: 5) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.text "cover"
    t.string "status", default: "open"
    t.text "status_reason"
    t.boolean "project_terms_agreement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "published_date"
    t.date "latest_start_date"
    t.date "award_date"
    t.string "contract_length"
    t.integer "day_rate"
    t.text "working_arrangements"
    t.string "address_company"
    t.string "address_1"
    t.string "address_2"
    t.string "address_town"
    t.string "address_county"
    t.string "address_postcode"
    t.text "team"
    t.text "requirements"
    t.boolean "open", default: false
    t.string "keywords", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "web_address"
  end

  create_table "referrals", force: :cascade do |t|
    t.bigint "user_id"
    t.text "email"
    t.string "status", default: "referred"
    t.integer "referred_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_referrals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "contact_phone"
    t.boolean "admin", default: false
    t.string "address_company"
    t.string "address_1"
    t.string "address_2"
    t.string "address_town"
    t.string "address_county"
    t.string "address_postcode"
    t.string "emergency_name"
    t.string "emergency_relationship"
    t.string "emergency_number"
    t.string "emergency_email"
    t.boolean "gdpr_agreement"
    t.boolean "job_email_agreement"
    t.boolean "marketing_email_agreement"
    t.boolean "website_terms_agreement"
    t.boolean "contractor_terms_agreement"
    t.boolean "verified", default: false
    t.boolean "cv_uploaded"
    t.datetime "cv_uploaded_date"
    t.string "cv_url"
    t.boolean "sa_uploaded"
    t.datetime "sa_uploaded_date"
    t.string "sa_url"
    t.string "keywords", array: true
    t.string "secondary_keywords"
    t.integer "profile_completion"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
