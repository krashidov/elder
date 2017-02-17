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

ActiveRecord::Schema.define(version: 20170217091022) do

  create_table "careplans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "client_id"
    t.integer  "provider_id"
    t.boolean  "relative_care",   default: false, null: false
    t.date     "start_date"
    t.string   "procedure_code"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["client_id"], name: "index_careplans_on_client_id", using: :btree
    t.index ["organization_id"], name: "index_careplans_on_organization_id", using: :btree
    t.index ["provider_id"], name: "index_careplans_on_provider_id", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "medicaid"
    t.string   "ssi"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "case_manager"
    t.string   "manager_phone"
    t.date     "date_of_birth"
    t.date     "par_expiration"
    t.text     "emergency_contact_info", limit: 65535
    t.string   "hours_plus_travel"
    t.integer  "units",                                default: 0
    t.date     "last_home_visit"
    t.string   "languages"
    t.date     "advanced_directive"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["organization_id"], name: "index_clients_on_organization_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organizations_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "ssi"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "hours_plus_travel"
    t.date     "date_of_birth"
    t.string   "emergency_contact_info"
    t.integer  "units",                         default: 0
    t.date     "staff_evaluation_date"
    t.date     "safety_training_date"
    t.string   "supervisor"
    t.string   "language"
    t.date     "id_expiration_date"
    t.date     "work_authorization_expiration"
    t.boolean  "active",                        default: true
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["organizations_id"], name: "index_providers_on_organizations_id", using: :btree
  end

  create_table "task_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.string   "name",                            null: false
    t.boolean  "homemaking",      default: false, null: false
    t.integer  "value",           default: 0,     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["organization_id"], name: "index_task_types_on_organization_id", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "organization_id"
    t.integer  "careplan_id"
    t.integer  "task_type_id"
    t.boolean  "monday",          default: false, null: false
    t.boolean  "tuesday",         default: false, null: false
    t.boolean  "wednesday",       default: false, null: false
    t.boolean  "thursday",        default: false, null: false
    t.boolean  "friday",          default: false, null: false
    t.boolean  "saturday",        default: false, null: false
    t.boolean  "sunday",          default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["careplan_id"], name: "index_tasks_on_careplan_id", using: :btree
    t.index ["organization_id"], name: "index_tasks_on_organization_id", using: :btree
    t.index ["task_type_id"], name: "index_tasks_on_task_type_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "organization_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
