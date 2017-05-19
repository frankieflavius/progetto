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

ActiveRecord::Schema.define(version: 20170518201819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartella_clinicas", force: :cascade do |t|
    t.text     "diagnosi"
    t.text     "valutazione_anatomica"
    t.text     "valutazione_funzionale"
    t.text     "iniziale_finale"
    t.text     "anamnesi"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "paziente_id"
    t.string   "data"
    t.string   "chiave"
  end

  add_index "cartella_clinicas", ["paziente_id"], name: "index_cartella_clinicas_on_paziente_id", using: :btree

  create_table "pazientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cognome"
    t.string   "email"
    t.string   "telefono"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

  add_foreign_key "cartella_clinicas", "pazientes"
end
