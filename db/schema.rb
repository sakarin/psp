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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110917055317) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "department"
    t.string   "collaborator"
    t.string   "address"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "factories", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "collaborator"
    t.string   "telephone"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "glues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.string   "number"
    t.integer  "factory_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", :force => true do |t|
    t.integer  "invoice_id"
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "seek_quantity"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",         :default => 0
  end

  create_table "logs", :force => true do |t|
    t.string   "user"
    t.string   "system"
    t.string   "action"
    t.string   "result"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufactures", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",      :default => 0
  end

  create_table "mouths", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.integer  "product_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "quantity"
    t.string   "note"
    t.integer  "manufacture_flag", :default => 0
    t.integer  "stock_flag",       :default => 0
    t.integer  "sent_flag",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.datetime "complete_at"
    t.integer  "invoice_flag",     :default => 0
    t.integer  "end_date_flag",    :default => 0
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.integer  "product_type"
    t.integer  "customer_id"
    t.string   "name"
    t.string   "print_color"
    t.integer  "pump_id"
    t.integer  "pump_line_id"
    t.integer  "glue_id"
    t.string   "paper"
    t.string   "thick"
    t.integer  "cut_id"
    t.string   "size"
    t.string   "width"
    t.string   "high"
    t.string   "side"
    t.string   "cut_unit"
    t.integer  "coat_id"
    t.integer  "mouth_id"
    t.string   "bottom"
    t.integer  "ear"
    t.string   "ear_number"
    t.string   "ear_long"
    t.string   "ear_unit"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",     :default => 0
    t.integer  "material",     :default => 0
  end

  create_table "pump_lines", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pumps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sents", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",      :default => 0
  end

  create_table "stocks", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "factory_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state",      :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "name"
    t.string   "role"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
