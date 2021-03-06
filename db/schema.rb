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

ActiveRecord::Schema.define(version: 20161208054856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_row_order_to_machines", force: :cascade do |t|
    t.integer  "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intervals", force: :cascade do |t|
    t.date     "date",       null: false
    t.integer  "exchange",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "exchange"], name: "index_intervals_on_date_and_exchange", unique: true, using: :btree
  end

  create_table "machines", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "row_order"
  end

  create_table "order_machine_usage_intervals", force: :cascade do |t|
    t.integer  "order_machine_usage_id",             null: false
    t.integer  "row_order",                          null: false
    t.integer  "workers",                default: 1, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["order_machine_usage_id", "row_order"], name: "omu_intervals_idx", unique: true, using: :btree
    t.index ["order_machine_usage_id"], name: "index_order_machine_usage_intervals_on_order_machine_usage_id", using: :btree
  end

  create_table "order_machine_usages", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "machine_id"
    t.integer  "after_machine_usage_id"
    t.string   "start_condition",        null: false
    t.integer  "skip_steps"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["after_machine_usage_id"], name: "index_order_machine_usages_on_after_machine_usage_id", using: :btree
    t.index ["machine_id"], name: "index_order_machine_usages_on_machine_id", using: :btree
    t.index ["order_id", "machine_id"], name: "index_order_machine_usages_on_order_id_and_machine_id", unique: true, using: :btree
    t.index ["order_id"], name: "index_order_machine_usages_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "row_order"
    t.boolean  "is_active"
    t.string   "color"
  end

  create_table "work_dates", force: :cascade do |t|
    t.date     "date",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "workers",    default: 0, null: false
    t.integer  "exchange",   default: 1, null: false
    t.index ["date", "exchange"], name: "index_work_dates_on_date_and_exchange", unique: true, using: :btree
  end

  add_foreign_key "order_machine_usage_intervals", "order_machine_usages"
  add_foreign_key "order_machine_usages", "machines"
  add_foreign_key "order_machine_usages", "order_machine_usages", column: "after_machine_usage_id"
  add_foreign_key "order_machine_usages", "orders"
end
