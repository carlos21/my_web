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

ActiveRecord::Schema.define(:version => 20120713222530) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "path"
    t.string   "route"
    t.integer  "visits"
    t.string   "language"
    t.string   "image_url"
    t.string   "small_description"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "tooltip"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "status"
    t.string   "image_url"
    t.string   "path"
    t.string   "small_description"
  end

  create_table "comments", :force => true do |t|
    t.integer  "article_id"
    t.string   "name"
    t.string   "website"
    t.string   "email"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_foreign_key "articles", "categories", :name => "articles_category_id_fk"

  add_foreign_key "comments", "articles", :name => "comments_article_id_fk"

end
