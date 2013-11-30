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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131130132534) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.string   "organism"
    t.string   "organism_kind"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "agencies", ["name"], :name => "index_agencies_on_name"

  create_table "incomes", :force => true do |t|
    t.integer  "region_id"
    t.integer  "year"
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "incomes", ["region_id"], :name => "index_incomes_on_region_id"

  create_table "projects", :force => true do |t|
    t.integer  "region_id"
    t.integer  "topic_id"
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.string   "started_at"
    t.string   "ended_at"
    t.integer  "duration"
    t.string   "aid_kind"
    t.string   "aid_via"
    t.string   "odm"
    t.string   "meta_odm"
    t.string   "beneficiaries_kind"
    t.integer  "beneficiaries_count"
    t.integer  "beneficiaries_women"
    t.text     "result"
    t.string   "intervention_number"
    t.string   "internal_code"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "projects", ["region_id"], :name => "index_projects_on_region_id"
  add_index "projects", ["title"], :name => "index_projects_on_title"
  add_index "projects", ["topic_id"], :name => "index_projects_on_topic_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["name"], :name => "index_regions_on_name"

  create_table "topics", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "topics", ["code"], :name => "index_topics_on_code"
  add_index "topics", ["parent_id"], :name => "index_topics_on_parent_id"

end
