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

ActiveRecord::Schema.define(version: 20170110203014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incoming_messages", force: :cascade do |t|
    t.string   "sid"
    t.string   "number"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_incoming_messages_on_number", using: :btree
    t.index ["sid"], name: "index_incoming_messages_on_sid", using: :btree
    t.index ["user_id"], name: "index_incoming_messages_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.string   "media"
    t.string   "sender_number"
    t.jsonb    "recipients"
    t.string   "recipient_type"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "sender_name"
    t.string   "service"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "outgoing_messages", force: :cascade do |t|
    t.string   "zid"
    t.string   "name"
    t.string   "sid"
    t.string   "number"
    t.string   "status"
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_outgoing_messages_on_message_id", using: :btree
    t.index ["number"], name: "index_outgoing_messages_on_number", using: :btree
    t.index ["sid"], name: "index_outgoing_messages_on_sid", using: :btree
    t.index ["user_id"], name: "index_outgoing_messages_on_user_id", using: :btree
    t.index ["zid"], name: "index_outgoing_messages_on_zid", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "service_id"
    t.string   "authentication_token"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_services_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "authentication_token",   limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "incoming_messages", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "outgoing_messages", "messages"
  add_foreign_key "outgoing_messages", "users"
  add_foreign_key "services", "users"
end
