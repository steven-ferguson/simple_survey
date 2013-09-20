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

ActiveRecord::Schema.define(version: 20130919232138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer "question_id"
    t.string  "content"
  end

  create_table "questions", force: true do |t|
    t.string  "content"
    t.integer "survey_id"
    t.string  "response_type"
  end

  create_table "responders", force: true do |t|
    t.integer  "user_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer "answer_id"
    t.integer "responder_id"
    t.string  "answer_type"
  end

  create_table "selections", force: true do |t|
    t.integer "answer_id"
    t.integer "response_id"
  end

  create_table "surveys", force: true do |t|
    t.string "title"
    t.string "directions"
  end

  create_table "users", force: true do |t|
    t.string "name"
  end

end
