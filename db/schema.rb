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

ActiveRecord::Schema.define(version: 20150914052012) do

  create_table "landlords", force: :cascade do |t|
    t.string "email"
    t.string "phone"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "landlord_id"
    t.integer "bedroom_count"
    t.integer "bathroom_count"
    t.string  "latitude"
    t.string  "longitude"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zipcode"
    t.integer "price"
    t.string  "listing_source_url"
    t.string  "listing_id"
    t.string  "title"
    t.text    "description"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "listing_id"
    t.string  "url"
  end

end
