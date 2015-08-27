# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150827163145) do

  create_table "cells", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sector_id"
  end

  add_index "cells", ["sector_id"], name: "index_cells_on_sector_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.integer  "max_cell_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cell_id"
    t.string   "foto_url"
  end

  add_index "items", ["cell_id"], name: "index_items_on_cell_id"

  create_table "sectors", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "warehouse_id"
  end

  add_index "sectors", ["warehouse_id"], name: "index_sectors_on_warehouse_id"

  create_table "warehouses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
  end

end
