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

ActiveRecord::Schema.define(version: 20170222104305) do

  create_table "departments", force: :cascade do |t|
    t.integer  "station_id"
    t.string   "name"
    t.string   "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.integer  "age"
    t.string   "birth_place"
    t.date     "birth_date"
    t.integer  "gender_id"
    t.integer  "religion_id"
    t.integer  "position_id"
    t.integer  "education_id"
    t.string   "experience"
    t.string   "skill"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "food_recipes", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "item_id"
    t.integer  "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_food_recipes_on_food_id"
    t.index ["item_id"], name: "index_food_recipes_on_item_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "item_category_id"
    t.integer  "item_unit_id"
    t.string   "code"
    t.string   "name"
    t.text     "spec"
    t.integer  "price"
    t.text     "desc"
    t.string   "halal_certificate"
    t.boolean  "warranty"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "purchase_request_details", force: :cascade do |t|
    t.integer  "purchase_request_id"
    t.integer  "item_id"
    t.integer  "qty"
    t.integer  "total"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["item_id"], name: "index_purchase_request_details_on_item_id"
    t.index ["purchase_request_id"], name: "index_purchase_request_details_on_purchase_request_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "pr_number"
    t.date     "date_created"
    t.date     "date_required"
    t.string   "request_reason"
    t.boolean  "status"
    t.string   "status_desc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "total"
    t.index ["employee_id"], name: "index_purchase_requests_on_employee_id"
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "business_field"
    t.string   "management_system"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

end
