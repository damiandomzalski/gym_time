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

ActiveRecord::Schema.define(version: 2018_12_10_191123) do

  create_table "abilities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.date "day"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_abilities_on_user_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "number_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_attends", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activities_id"], name: "index_activities_attends_on_activities_id"
    t.index ["user_id"], name: "index_activities_attends_on_user_id"
  end

  create_table "activities_calendars", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.date "day"
    t.integer "user_id"
    t.integer "activities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activities_id"], name: "index_activities_calendars_on_activities_id"
    t.index ["user_id"], name: "index_activities_calendars_on_user_id"
  end

  create_table "adresses", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.date "date_birth"
    t.integer "pesel"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_adresses_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.integer "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "discount"
    t.float "discount_size"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.date "fix_start_date"
    t.date "fix_end_date"
    t.integer "price"
    t.integer "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_repairs_on_equipment_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "purchased_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_tickets_on_product_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "start_visit"
    t.datetime "end_visit"
    t.integer "user_id"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_visits_on_ticket_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

end
