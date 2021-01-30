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

ActiveRecord::Schema.define(version: 2021_01_20_140247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "amc_requests", force: :cascade do |t|
    t.bigint "amc_id", null: false
    t.string "number"
    t.datetime "date"
    t.text "place"
    t.string "status"
    t.decimal "amount", precision: 8, scale: 2
    t.string "assigned_to"
    t.bigint "user_id", null: false
    t.integer "pin"
    t.string "report"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "assigned_on"
    t.datetime "closed_on"
    t.index ["amc_id"], name: "index_amc_requests_on_amc_id"
    t.index ["user_id"], name: "index_amc_requests_on_user_id"
  end

  create_table "amcs", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "sale_id", null: false
    t.string "amc_type"
    t.datetime "from"
    t.datetime "to"
    t.string "terms"
    t.string "notes"
    t.bigint "user_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_amcs_on_client_id"
    t.index ["order_id"], name: "index_amcs_on_order_id"
    t.index ["sale_id"], name: "index_amcs_on_sale_id"
    t.index ["user_id"], name: "index_amcs_on_user_id"
  end

  create_table "branches", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "address_1"
    t.text "address_2"
    t.text "city"
    t.integer "pin_code"
    t.string "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gstin"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "gstin"
    t.string "email"
    t.string "mobile"
    t.string "land_line"
    t.text "address_1"
    t.string "city"
    t.string "pin_code"
    t.string "bank_name"
    t.string "ifsc_no"
    t.string "account_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_2"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_logs", force: :cascade do |t|
    t.string "loggable_type"
    t.integer "loggable_id"
    t.string "log_type"
    t.string "to"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_email_logs_on_user_id"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "hsn"
    t.string "code"
    t.string "part_number"
    t.string "specification"
    t.integer "remaining_quantity"
    t.decimal "sell_price", precision: 8, scale: 2
    t.float "purchase_price"
    t.string "unit"
    t.integer "opening_stock"
    t.integer "minimum_quantity"
    t.boolean "active", default: true
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "job_cards", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.string "sl_no"
    t.string "rating"
    t.string "phase"
    t.string "qty"
    t.string "sticker"
    t.string "input"
    t.string "output"
    t.bigint "product_model_id", null: false
    t.string "variac"
    t.string "tap_for_200"
    t.string "brush"
    t.string "base"
    t.string "rack"
    t.string "chassis"
    t.string "fan"
    t.string "fuse_line"
    t.string "contactor"
    t.string "packing"
    t.string "neutral"
    t.string "cos"
    t.string "mcb"
    t.string "relay"
    t.string "ratio_ct"
    t.string "direct_ct"
    t.string "motor"
    t.string "pt_clamp"
    t.boolean "approved"
    t.string "approved_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_job_cards_on_order_id"
    t.index ["product_model_id"], name: "index_job_cards_on_product_model_id"
    t.index ["sale_id"], name: "index_job_cards_on_sale_id"
    t.index ["user_id"], name: "index_job_cards_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.string "address_1"
    t.string "city"
    t.string "pincode"
    t.datetime "delivery_date"
    t.string "remarks"
    t.string "note"
    t.bigint "user_id", null: false
    t.boolean "approved"
    t.string "approved_by"
    t.bigint "client_id", null: false
    t.bigint "sale_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address_2"
    t.decimal "tax_1_amount", precision: 8, scale: 2
    t.decimal "tax_2_amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "sub_total", precision: 8, scale: 2
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["sale_id"], name: "index_orders_on_sale_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_line_models", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_model_id"
    t.decimal "product_model_cost", precision: 8, scale: 2
    t.decimal "product_model_sell_price", precision: 8, scale: 2
    t.integer "product_model_quantity"
    t.decimal "product_model_amount", precision: 8, scale: 2
    t.string "product_model_name"
    t.integer "product_model_hsn"
    t.string "product_model_unit"
    t.decimal "tax_1_percentage", precision: 8, scale: 2
    t.decimal "tax_2_percentage", precision: 8, scale: 2
    t.string "tax_1_name"
    t.string "tax_2_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orders_line_models_on_order_id"
    t.index ["product_model_id"], name: "index_orders_line_models_on_product_model_id"
  end

  create_table "product_models", force: :cascade do |t|
    t.string "name"
    t.string "input_range"
    t.string "output_range"
    t.string "frequency"
    t.string "protections"
    t.string "kva"
    t.string "optional"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hsn"
    t.decimal "price", precision: 8, scale: 2
  end

  create_table "purchase_entries", force: :cascade do |t|
    t.integer "payment_type"
    t.bigint "purchase_order_id"
    t.decimal "tax_1_amount", precision: 8, scale: 2
    t.decimal "tax_2_amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "sub_total", precision: 8, scale: 2
    t.bigint "user_id"
    t.string "payment_status"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_order_id"], name: "index_purchase_entries_on_purchase_order_id"
    t.index ["user_id"], name: "index_purchase_entries_on_user_id"
  end

  create_table "purchase_entry_line_items", force: :cascade do |t|
    t.bigint "purchase_entry_id"
    t.bigint "item_id"
    t.decimal "item_cost", precision: 8, scale: 2
    t.decimal "item_sell_price", precision: 8, scale: 2
    t.integer "item_quantity"
    t.decimal "item_amount", precision: 8, scale: 2
    t.string "item_name"
    t.integer "item_hsn"
    t.string "item_unit"
    t.decimal "tax_1_percentage", precision: 8, scale: 2
    t.decimal "tax_2_percentage", precision: 8, scale: 2
    t.string "tax_1_name"
    t.string "tax_2_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_purchase_entry_line_items_on_item_id"
    t.index ["purchase_entry_id"], name: "index_purchase_entry_line_items_on_purchase_entry_id"
  end

  create_table "purchase_line_items", id: :serial, force: :cascade do |t|
    t.integer "purchase_order_id"
    t.integer "item_id"
    t.decimal "item_cost", precision: 8, scale: 2
    t.decimal "item_sell_price", precision: 8, scale: 2
    t.integer "item_quantity"
    t.decimal "item_amount", precision: 8, scale: 2
    t.string "item_name"
    t.integer "item_hsn"
    t.string "item_unit"
    t.decimal "tax_1_percentage", precision: 8, scale: 2
    t.decimal "tax_2_percentage", precision: 8, scale: 2
    t.string "tax_1_name"
    t.string "tax_2_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchase_line_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_purchase_line_items_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "payment_type"
    t.bigint "vendor_id"
    t.text "terms"
    t.text "notes"
    t.decimal "tax_1_amount", precision: 8, scale: 2
    t.decimal "tax_2_amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "sub_total", precision: 8, scale: 2
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_status"
    t.string "status"
    t.boolean "approved", default: false
    t.integer "approved_by"
    t.string "number"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "payment_type"
    t.bigint "client_id"
    t.text "terms"
    t.text "notes"
    t.decimal "tax_1_amount", precision: 8, scale: 2
    t.decimal "tax_2_amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "sub_total", precision: 8, scale: 2
    t.bigint "user_id"
    t.string "payment_status"
    t.string "status"
    t.string "number"
    t.string "sales_type"
    t.string "approved_by"
    t.boolean "approved", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sales_order"
    t.boolean "order_approved", default: false
    t.boolean "test_approved", default: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "sales_line_models", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "product_model_id"
    t.decimal "product_model_cost", precision: 8, scale: 2
    t.decimal "product_model_sell_price", precision: 8, scale: 2
    t.integer "product_model_quantity"
    t.decimal "product_model_amount", precision: 8, scale: 2
    t.string "product_model_name"
    t.integer "product_model_hsn"
    t.string "product_model_unit"
    t.decimal "tax_1_percentage", precision: 8, scale: 2
    t.decimal "tax_2_percentage", precision: 8, scale: 2
    t.string "tax_1_name"
    t.string "tax_2_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_model_id"], name: "index_sales_line_models_on_product_model_id"
    t.index ["sale_id"], name: "index_sales_line_models_on_sale_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.string "number"
    t.datetime "date"
    t.string "status"
    t.string "request_type"
    t.string "client_mobile"
    t.decimal "estimated_amount", precision: 8, scale: 2
    t.decimal "paid_amount", precision: 8, scale: 2
    t.string "assigned_to"
    t.datetime "assigned_on"
    t.datetime "closed_on"
    t.bigint "user_id", null: false
    t.integer "pin"
    t.string "report"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "pincode"
    t.bigint "client_id", null: false
    t.string "before_image"
    t.string "after_image"
    t.string "lat"
    t.string "lan"
    t.boolean "approved"
    t.string "approved_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_service_requests_on_client_id"
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "store_request_line_items", force: :cascade do |t|
    t.bigint "store_request_id"
    t.bigint "item_id"
    t.integer "item_quantity"
    t.string "item_name"
    t.integer "item_hsn"
    t.string "item_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_store_request_line_items_on_item_id"
    t.index ["store_request_id"], name: "index_store_request_line_items_on_store_request_id"
  end

  create_table "store_requests", force: :cascade do |t|
    t.text "notes"
    t.boolean "approved", default: false
    t.string "approved_by"
    t.bigint "order_id"
    t.bigint "sale_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "number"
    t.index ["order_id"], name: "index_store_requests_on_order_id"
    t.index ["sale_id"], name: "index_store_requests_on_sale_id"
    t.index ["user_id"], name: "index_store_requests_on_user_id"
  end

  create_table "store_return_line_items", id: :serial, force: :cascade do |t|
    t.integer "store_return_id"
    t.integer "item_id"
    t.decimal "item_cost", precision: 8, scale: 2
    t.decimal "item_sell_price", precision: 8, scale: 2
    t.integer "item_quantity"
    t.decimal "item_amount", precision: 8, scale: 2
    t.string "item_name"
    t.integer "item_hsn"
    t.string "item_unit"
    t.decimal "tax_1_percentage", precision: 8, scale: 2
    t.decimal "tax_2_percentage", precision: 8, scale: 2
    t.string "tax_1_name"
    t.string "tax_2_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_store_return_line_items_on_item_id"
    t.index ["store_return_id"], name: "index_store_return_line_items_on_store_return_id"
  end

  create_table "store_returns", force: :cascade do |t|
    t.integer "payment_type"
    t.string "number"
    t.bigint "vendor_id"
    t.text "terms"
    t.text "notes"
    t.decimal "tax_1_amount", precision: 8, scale: 2
    t.decimal "tax_2_amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "sub_total", precision: 8, scale: 2
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "payment_status"
    t.string "status"
    t.boolean "approved", default: false
    t.string "approved_by"
    t.index ["user_id"], name: "index_store_returns_on_user_id"
    t.index ["vendor_id"], name: "index_store_returns_on_vendor_id"
  end

  create_table "taxes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.integer "tax_type"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_reports", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "client_id", null: false
    t.string "number"
    t.string "rating"
    t.string "input"
    t.string "output"
    t.string "cooling_method"
    t.string "insulation_test"
    t.string "ht_test"
    t.string "ip_low"
    t.string "op_low"
    t.string "cur_low"
    t.string "ip_up"
    t.string "op_up"
    t.string "cur_up"
    t.string "ip_low_cut"
    t.string "op_low_cut"
    t.string "trip_low_cut"
    t.string "ip_high_cut"
    t.string "op_high_cut"
    t.string "trip_high_cut"
    t.string "over_load_current"
    t.string "overe_load_time"
    t.string "cycle"
    t.bigint "user_id", null: false
    t.string "result"
    t.boolean "approved"
    t.string "approved_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "order_id"
    t.index ["client_id"], name: "index_test_reports_on_client_id"
    t.index ["sale_id"], name: "index_test_reports_on_sale_id"
    t.index ["user_id"], name: "index_test_reports_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "employee_code"
    t.boolean "active", default: true
    t.integer "branch_id"
    t.integer "department_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "pan_file"
    t.string "aadhar_file"
    t.string "photo"
    t.string "pan_no"
    t.string "aadhar_no"
    t.string "bank_name"
    t.string "account_no"
    t.string "ifsc_no"
    t.string "unique_session_id"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vendors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "gstin"
    t.string "email"
    t.string "mobile"
    t.string "land_line"
    t.text "address_1"
    t.string "city"
    t.string "pin_code"
    t.string "bank_name"
    t.string "ifsc_no"
    t.string "account_no"
    t.integer "credit_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_2"
  end

  add_foreign_key "amc_requests", "amcs"
  add_foreign_key "amc_requests", "users"
  add_foreign_key "amcs", "clients"
  add_foreign_key "amcs", "orders"
  add_foreign_key "amcs", "sales"
  add_foreign_key "amcs", "users"
  add_foreign_key "email_logs", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "job_cards", "orders"
  add_foreign_key "job_cards", "product_models"
  add_foreign_key "job_cards", "sales"
  add_foreign_key "job_cards", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "sales"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_line_models", "orders"
  add_foreign_key "orders_line_models", "product_models"
  add_foreign_key "purchase_entries", "purchase_orders"
  add_foreign_key "purchase_entries", "users"
  add_foreign_key "purchase_entry_line_items", "items"
  add_foreign_key "purchase_entry_line_items", "purchase_entries"
  add_foreign_key "purchase_line_items", "items"
  add_foreign_key "purchase_line_items", "purchase_orders"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "purchase_orders", "vendors"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "users"
  add_foreign_key "sales_line_models", "product_models"
  add_foreign_key "sales_line_models", "sales"
  add_foreign_key "service_requests", "clients"
  add_foreign_key "service_requests", "users"
  add_foreign_key "store_request_line_items", "items"
  add_foreign_key "store_request_line_items", "store_requests"
  add_foreign_key "store_requests", "orders"
  add_foreign_key "store_requests", "sales"
  add_foreign_key "store_requests", "users"
  add_foreign_key "store_return_line_items", "items"
  add_foreign_key "store_return_line_items", "store_returns"
  add_foreign_key "store_returns", "users"
  add_foreign_key "store_returns", "vendors"
  add_foreign_key "test_reports", "clients"
  add_foreign_key "test_reports", "sales"
  add_foreign_key "test_reports", "users"
  add_foreign_key "users", "branches"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
