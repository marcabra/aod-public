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

ActiveRecord::Schema.define(version: 20131216213604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: true do |t|
    t.string   "name"
    t.string   "organism"
    t.string   "organism_kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agencies", ["name"], name: "index_agencies_on_name", using: :btree

  create_table "aids", force: true do |t|
    t.integer  "project_id"
    t.integer  "agency_id"
    t.integer  "year"
    t.decimal  "committed_amount", precision: 12, scale: 2, default: 0.0
    t.decimal  "paid_amount",      precision: 12, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "returned_amount",  precision: 12, scale: 2, default: 0.0
  end

  add_index "aids", ["agency_id"], name: "index_aids_on_agency_id", using: :btree
  add_index "aids", ["project_id"], name: "index_aids_on_project_id", using: :btree
  add_index "aids", ["year"], name: "index_aids_on_year", using: :btree

  create_table "geodata", force: true do |t|
    t.text     "the_geom"
    t.string   "iso_code"
    t.string   "name"
    t.integer  "region"
    t.integer  "subregion"
    t.float    "lon"
    t.float    "lat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geodata", ["iso_code"], name: "index_geodata_on_iso_code", using: :btree

  create_table "incomes", force: true do |t|
    t.integer  "region_id"
    t.integer  "year"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incomes", ["region_id"], name: "index_incomes_on_region_id", using: :btree

  create_table "projects", force: true do |t|
    t.integer  "region_id"
    t.integer  "topic_id"
    t.text     "title"
    t.text     "description"
    t.text     "location"
    t.string   "started_at"
    t.string   "ended_at"
    t.string   "duration"
    t.string   "aid_kind"
    t.string   "aid_via"
    t.text     "odm"
    t.text     "meta_odm"
    t.string   "beneficiaries_kind"
    t.integer  "beneficiaries_count"
    t.integer  "beneficiaries_women"
    t.text     "result"
    t.string   "intervention_number"
    t.string   "internal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["region_id"], name: "index_projects_on_region_id", using: :btree
  add_index "projects", ["title"], name: "index_projects_on_title", using: :btree
  add_index "projects", ["topic_id"], name: "index_projects_on_topic_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name"
    t.string   "area"
    t.string   "iso_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regions", ["iso_code"], name: "index_regions_on_iso_code", using: :btree
  add_index "regions", ["name"], name: "index_regions_on_name", using: :btree

  create_table "topics", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ancestry_depth", default: 0
  end

  add_index "topics", ["ancestry"], name: "index_topics_on_ancestry", using: :btree
  add_index "topics", ["code"], name: "index_topics_on_code", using: :btree

end
