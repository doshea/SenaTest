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

ActiveRecord::Schema.define(:version => 20130618044753) do

  create_table "chambers", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "male_title"
    t.string   "female_title"
    t.string   "neuter_title"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.string   "adjective"
    t.string   "member_noun"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "politicians", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "name_suffix"
    t.string   "gender"
    t.date     "birthday"
    t.boolean  "seniority"
    t.boolean  "in_office"
    t.integer  "senate_class"
    t.integer  "govtrack_id"
    t.integer  "state_id"
    t.integer  "chamber_id"
    t.integer  "party_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.boolean  "nonvoting",    :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

end
