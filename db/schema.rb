# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_13_165954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "street"
    t.integer "number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "neighborhood"
  end

  create_table "beneficiaries", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.bigint "address_id", null: false
    t.string "birthDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_beneficiaries_on_address_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.bigint "presence_id", null: false
    t.bigint "volunteer_id", null: false
    t.string "date"
    t.bigint "organizer_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_certificates_on_event_id"
    t.index ["organizer_id"], name: "index_certificates_on_organizer_id"
    t.index ["presence_id"], name: "index_certificates_on_presence_id"
    t.index ["volunteer_id"], name: "index_certificates_on_volunteer_id"
  end

  create_table "donations", force: :cascade do |t|
    t.string "category"
    t.float "quantity"
    t.string "position"
    t.string "destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.bigint "volunteer_id", null: false
    t.string "vehicle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["volunteer_id"], name: "index_drivers_on_volunteer_id"
  end

  create_table "event_places", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "placeid"
    t.string "name"
    t.string "address"
    t.float "lat"
    t.float "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_places_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.string "date"
    t.string "startDate"
    t.string "endDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_have_locals", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "local_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_events_have_locals_on_event_id"
    t.index ["local_id"], name: "index_events_have_locals_on_local_id"
  end

  create_table "events_have_teams", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_events_have_teams_on_event_id"
    t.index ["team_id"], name: "index_events_have_teams_on_team_id"
  end

  create_table "locals", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_locals_on_address_id"
  end

  create_table "manage_donations", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "donation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["donation_id"], name: "index_manage_donations_on_donation_id"
    t.index ["event_id"], name: "index_manage_donations_on_event_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["volunteer_id"], name: "index_organizers_on_volunteer_id"
  end

  create_table "presences", force: :cascade do |t|
    t.string "date"
    t.string "startDate"
    t.string "endDate"
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["volunteer_id"], name: "index_presences_on_volunteer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_roles_on_event_id"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes_have_locals", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "local_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["local_id"], name: "index_routes_have_locals_on_local_id"
    t.index ["route_id"], name: "index_routes_have_locals_on_route_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_teams_on_event_id"
  end

  create_table "teams_have_volunteers", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_teams_have_volunteers_on_team_id"
    t.index ["volunteer_id"], name: "index_teams_have_volunteers_on_volunteer_id"
  end

  create_table "trainments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "cpf"
    t.string "identity"
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_volunteers_on_address_id"
    t.index ["user_id"], name: "index_volunteers_on_user_id"
  end

  create_table "volunter_has_events", force: :cascade do |t|
    t.bigint "volunteer_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_volunter_has_events_on_event_id"
    t.index ["volunteer_id"], name: "index_volunter_has_events_on_volunteer_id"
  end

  add_foreign_key "beneficiaries", "addresses"
  add_foreign_key "certificates", "events"
  add_foreign_key "certificates", "organizers"
  add_foreign_key "certificates", "presences"
  add_foreign_key "certificates", "volunteers"
  add_foreign_key "drivers", "volunteers"
  add_foreign_key "event_places", "events"
  add_foreign_key "events", "users"
  add_foreign_key "events_have_locals", "events"
  add_foreign_key "events_have_locals", "locals"
  add_foreign_key "events_have_teams", "events"
  add_foreign_key "events_have_teams", "teams"
  add_foreign_key "locals", "addresses"
  add_foreign_key "manage_donations", "donations"
  add_foreign_key "manage_donations", "events"
  add_foreign_key "organizers", "volunteers"
  add_foreign_key "presences", "volunteers"
  add_foreign_key "roles", "events"
  add_foreign_key "roles", "users"
  add_foreign_key "routes_have_locals", "locals"
  add_foreign_key "routes_have_locals", "routes"
  add_foreign_key "teams", "events"
  add_foreign_key "teams_have_volunteers", "teams"
  add_foreign_key "teams_have_volunteers", "volunteers"
  add_foreign_key "volunteers", "addresses"
  add_foreign_key "volunteers", "users"
  add_foreign_key "volunter_has_events", "events"
  add_foreign_key "volunter_has_events", "volunteers"
end
