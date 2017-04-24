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

ActiveRecord::Schema.define(version: 20170424082230) do

  create_table "cycles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "flight_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "flight_class_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["flight_class_id"], name: "index_flight_types_on_flight_class_id"
  end

  create_table "food_menu_details", force: :cascade do |t|
    t.integer  "food_menu_id"
    t.integer  "food_id"
    t.integer  "food_qty"
    t.decimal  "weight"
    t.boolean  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["food_id"], name: "index_food_menu_details_on_food_id"
    t.index ["food_menu_id"], name: "index_food_menu_details_on_food_menu_id"
  end

  create_table "food_menus", force: :cascade do |t|
    t.integer  "cycle_id"
    t.integer  "flight_class_id"
    t.string   "name"
    t.date     "start_date_peroid"
    t.date     "date_peroid_end"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["cycle_id"], name: "index_food_menus_on_cycle_id"
    t.index ["flight_class_id"], name: "index_food_menus_on_flight_class_id"
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

  create_table "fund_administrations", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.integer  "ammount"
    t.date     "date_out"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["purchase_order_id"], name: "index_fund_administrations_on_purchase_order_id"
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

  create_table "purchase_order_addresses", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "pic"
    t.integer  "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "purchase_request_id"
    t.integer  "purchase_order_address_id"
    t.string   "po_number"
    t.datetime "arrival_estimated"
    t.string   "status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["purchase_order_address_id"], name: "index_purchase_orders_on_purchase_order_address_id"
    t.index ["purchase_request_id"], name: "index_purchase_orders_on_purchase_request_id"
  end

  create_table "purchase_request_details", force: :cascade do |t|
    t.integer  "purchase_request_id"
    t.integer  "item_id"
    t.integer  "qty"
    t.integer  "sub_total"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["item_id"], name: "index_purchase_request_details_on_item_id"
    t.index ["purchase_request_id"], name: "index_purchase_request_details_on_purchase_request_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "pr_number"
    t.date     "date_created"
    t.date     "date_required"
    t.string   "request_reason"
    t.boolean  "status"
    t.string   "status_desc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "total"
    t.integer  "updated_user_id"
    t.index ["employee_id"], name: "index_purchase_requests_on_employee_id"
    t.index ["updated_user_id"], name: "index_purchase_requests_on_updated_user_id"
  end

  create_table "religions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standard_recipe_details", force: :cascade do |t|
    t.integer  "standard_recipe_id"
    t.integer  "item_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["item_id"], name: "index_standard_recipe_details_on_item_id"
    t.index ["standard_recipe_id"], name: "index_standard_recipe_details_on_standard_recipe_id"
  end

  create_table "standard_recipes", force: :cascade do |t|
    t.integer  "cycle_id"
    t.integer  "flight_type_id"
    t.string   "name"
    t.integer  "pax_qty"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "created_user_id"
    t.integer  "updated_user_id"
    t.index ["created_user_id"], name: "index_standard_recipes_on_created_user_id"
    t.index ["cycle_id"], name: "index_standard_recipes_on_cycle_id"
    t.index ["flight_type_id"], name: "index_standard_recipes_on_flight_type_id"
    t.index ["updated_user_id"], name: "index_standard_recipes_on_updated_user_id"
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
