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

ActiveRecord::Schema.define(version: 20150916221707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image_url"
    t.string   "website"
  end

  create_table "event_agents", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "agent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_agents", ["agent_id"], name: "index_event_agents_on_agent_id", using: :btree
  add_index "event_agents", ["event_id"], name: "index_event_agents_on_event_id", using: :btree

  create_table "event_listings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_listings", ["event_id"], name: "index_event_listings_on_event_id", using: :btree
  add_index "event_listings", ["listing_id"], name: "index_event_listings_on_listing_id", using: :btree

  create_table "event_prospects", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "prospect_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "event_prospects", ["event_id"], name: "index_event_prospects_on_event_id", using: :btree
  add_index "event_prospects", ["prospect_id"], name: "index_event_prospects_on_prospect_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "date"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "event_type"
    t.integer  "agent_id"
    t.integer  "listing_id"
    t.integer  "prospect_id"
    t.integer  "meeting_agent"
  end

  add_index "events", ["agent_id"], name: "index_events_on_agent_id", using: :btree
  add_index "events", ["listing_id"], name: "index_events_on_listing_id", using: :btree
  add_index "events", ["prospect_id"], name: "index_events_on_prospect_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.integer  "sqft"
    t.string   "bed"
    t.string   "bath"
    t.string   "description"
    t.string   "image_url"
    t.integer  "agent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "status"
    t.integer  "price"
  end

  add_index "listings", ["agent_id"], name: "index_listings_on_agent_id", using: :btree

  create_table "open_houses", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "agent_id"
    t.string   "date"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "open_houses", ["agent_id"], name: "index_open_houses_on_agent_id", using: :btree
  add_index "open_houses", ["listing_id"], name: "index_open_houses_on_listing_id", using: :btree

  create_table "prospects", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.integer  "open_house_id"
    t.string   "notes"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "agent_id"
  end

  add_index "prospects", ["agent_id"], name: "index_prospects_on_agent_id", using: :btree
  add_index "prospects", ["open_house_id"], name: "index_prospects_on_open_house_id", using: :btree

  add_foreign_key "event_agents", "agents"
  add_foreign_key "event_agents", "events"
  add_foreign_key "event_listings", "events"
  add_foreign_key "event_listings", "listings"
  add_foreign_key "event_prospects", "events"
  add_foreign_key "event_prospects", "prospects"
  add_foreign_key "events", "agents"
  add_foreign_key "events", "listings"
  add_foreign_key "events", "prospects"
  add_foreign_key "listings", "agents"
  add_foreign_key "open_houses", "agents"
  add_foreign_key "open_houses", "listings"
  add_foreign_key "prospects", "agents"
  add_foreign_key "prospects", "open_houses"
end
