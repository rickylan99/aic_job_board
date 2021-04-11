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

ActiveRecord::Schema.define(version: 2021_04_09_053902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_submissions", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "phone_number"
    t.string "classification"
    t.string "major"
    t.string "last_name"
    t.string "public_id"
    t.string "file_name"
    t.string "documenttype"
    t.text "q1"
    t.text "q2"
    t.text "q3"
    t.text "q4"
  end

  create_table "application_documents", force: :cascade do |t|
    t.string "public_id"
    t.string "documenttype"
    t.string "file_name"
    t.integer "job_application_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer "user_id"
    t.string "public_id"
    t.string "file_name"
    t.string "documenttype"
    t.datetime "dateupdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "documents_job_applications", id: false, force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "job_application_id", null: false
  end

  create_table "firms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo"
    t.string "location"
    t.string "industry"
    t.string "website"
    t.string "linkedin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_linkedin"
  end

  create_table "job_application_answers", force: :cascade do |t|
    t.text "answer"
    t.bigint "job_application_id", null: false
    t.bigint "job_question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_application_id"], name: "index_job_application_answers_on_job_application_id"
    t.index ["job_question_id"], name: "index_job_application_answers_on_job_question_id"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string "answers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "job_id", null: false
    t.bigint "user_id", null: false
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["user_id"], name: "index_job_applications_on_user_id"
  end

  create_table "job_questions", force: :cascade do |t|
    t.text "question"
    t.bigint "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_job_questions_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "position"
    t.string "location"
    t.string "description"
    t.string "classifications"
    t.date "deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "firm_id", null: false
    t.bigint "user_id", null: false
    t.boolean "expired"
    t.index ["firm_id"], name: "index_jobs_on_firm_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "logos", force: :cascade do |t|
    t.integer "firm_id"
    t.binary "file"
    t.string "filename"
    t.string "mime_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "roletype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "classification"
    t.string "major"
    t.integer "document_id"
    t.boolean "isAuthorized"
    t.boolean "firstLogin"
    t.boolean "investment_banking"
    t.boolean "private_equity"
    t.boolean "venture_capital"
    t.boolean "real_estate"
    t.boolean "other_prefs"
    t.string "other_industrty_preferences"
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "job_application_answers", "job_applications"
  add_foreign_key "job_application_answers", "job_questions"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_questions", "jobs"
  add_foreign_key "jobs", "firms"
  add_foreign_key "jobs", "users"
end
