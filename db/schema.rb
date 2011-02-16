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

ActiveRecord::Schema.define(:version => 20110216012402) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities", :force => true do |t|
    t.integer  "app_id"
    t.string   "foreign_id"
    t.string   "foreign_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "avg_score"
    t.integer  "review_count"
    t.string   "name"
  end

  create_table "review_types", :force => true do |t|
    t.integer  "app_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_votes", :force => true do |t|
    t.integer  "review_id"
    t.string   "user_ref"
    t.string   "user_name"
    t.boolean  "helpful"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "app_id"
    t.integer  "entity_id"
    t.string   "user_ref"
    t.string   "user_name"
    t.string   "title"
    t.text     "body"
    t.float    "score"
    t.integer  "helpful_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "helpful_score"
  end

end
