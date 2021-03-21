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

ActiveRecord::Schema.define(version: 2021_03_15_011427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_applications", force: :cascade do |t|
    t.string "questions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "access_submissions", force: :cascade do |t|
    t.string "answers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "access_application_id", null: false
    t.index ["access_application_id"], name: "index_access_submissions_on_access_application_id"
    t.index ["user_id"], name: "index_access_submissions_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "file"
    t.string "documenttype"
    t.datetime "dateupdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
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
    t.index ["firm_id"], name: "index_jobs_on_firm_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
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
    t.boolean "authorized"
    t.boolean "first_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "access_submissions", "access_applications"
  add_foreign_key "access_submissions", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "job_application_answers", "job_applications"
  add_foreign_key "job_application_answers", "job_questions"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "users"
  add_foreign_key "job_questions", "jobs"
  add_foreign_key "jobs", "firms"
  add_foreign_key "jobs", "users"
  add_foreign_key "users", "roles"
end
