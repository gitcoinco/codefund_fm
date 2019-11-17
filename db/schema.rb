# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_17_195529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentication_providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_authentication_providers_on_name"
  end

  create_table "people", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "handle"
    t.string "github_handle"
    t.string "twitter_handle"
    t.string "linkedin_handle"
    t.text "bio"
    t.string "website"
    t.boolean "admin", default: false
    t.boolean "host", default: false
    t.boolean "editor", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "person_authentications", force: :cascade do |t|
    t.integer "person_id"
    t.integer "authentication_provider_id"
    t.string "uid"
    t.string "token"
    t.datetime "token_expires_at"
    t.text "params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authentication_provider_id"], name: "index_person_authentications_on_authentication_provider_id"
    t.index ["person_id"], name: "index_person_authentications_on_person_id"
  end

  create_table "social_accounts", force: :cascade do |t|
    t.string "token"
    t.string "secret"
    t.bigint "person_id"
    t.bigint "authentication_provider_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authentication_provider_id"], name: "index_social_accounts_on_authentication_provider_id"
    t.index ["person_id"], name: "index_social_accounts_on_person_id"
  end

  add_foreign_key "social_accounts", "authentication_providers"
  add_foreign_key "social_accounts", "people"
end
