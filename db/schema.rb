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

ActiveRecord::Schema.define(version: 2019_02_05_191633) do

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
    t.string "description"
    t.string "image"
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

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zip_code"
    t.string "city"
    t.date "date_birth"
    t.integer "pesel"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.integer "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.float "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.boolean "discount", default: false
    t.float "discount_size"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "image"
    t.integer "days"
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
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.index ["order_id"], name: "index_tickets_on_order_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
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
