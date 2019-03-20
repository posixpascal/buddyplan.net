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

ActiveRecord::Schema.define(version: 2019_03_20_101950) do

  create_table "action_events", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "schedule_event_id"
    t.string "action_type"
    t.integer "action_id"
    t.text "data"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estimate"
    t.datetime "scheduled_on"
    t.index ["schedule_event_id"], name: "index_action_events_on_schedule_event_id"
    t.index ["schedule_id"], name: "index_action_events_on_schedule_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "actor_contact_entries", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phonenumber"
    t.string "email"
    t.text "allergenes"
    t.string "street"
    t.string "location"
    t.string "postalcode"
    t.string "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
    t.index ["movie_id"], name: "index_actor_contact_entries_on_movie_id"
  end

  create_table "actors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "street"
    t.string "location"
    t.string "city"
    t.string "postalcode"
    t.text "allergenes"
    t.string "phonenumber"
    t.index ["movie_id"], name: "index_actors_on_movie_id"
    t.index ["user_id"], name: "index_actors_on_user_id"
  end

  create_table "break_events", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "schedule_event_id"
    t.integer "location_id"
    t.boolean "with_food"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estimate"
    t.datetime "scheduled_on"
    t.index ["location_id"], name: "index_break_events_on_location_id"
    t.index ["schedule_event_id"], name: "index_break_events_on_schedule_event_id"
    t.index ["schedule_id"], name: "index_break_events_on_schedule_id"
  end

  create_table "budget_expenses", force: :cascade do |t|
    t.integer "budget_id"
    t.integer "amount"
    t.text "reasoning"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_expenses_on_budget_id"
  end

  create_table "budget_incomes", force: :cascade do |t|
    t.integer "budget_id"
    t.integer "amount"
    t.text "reasoning"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_budget_incomes_on_budget_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_budgets_on_movie_id"
  end

  create_table "cars", force: :cascade do |t|
    t.integer "actor_id"
    t.string "vendor"
    t.string "license_plate"
    t.integer "fuel"
    t.integer "available_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
    t.index ["actor_id"], name: "index_cars_on_actor_id"
    t.index ["movie_id"], name: "index_cars_on_movie_id"
  end

  create_table "casts", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_casts_on_movie_id"
    t.index ["role_id"], name: "index_casts_on_role_id"
    t.index ["user_id"], name: "index_casts_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_documents_on_movie_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "schedule_event_id"
    t.integer "actor_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_event_participants_on_actor_id"
    t.index ["role_id"], name: "index_event_participants_on_role_id"
    t.index ["schedule_event_id"], name: "index_event_participants_on_schedule_event_id"
    t.index ["schedule_id"], name: "index_event_participants_on_schedule_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "movie_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "inventory_type"
    t.index ["movie_id"], name: "index_inventories_on_movie_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "inventory_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "data"
    t.integer "car_owner_id"
    t.string "license_plate"
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "items_scenes", force: :cascade do |t|
    t.integer "item_id"
    t.integer "scene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.string "name"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "for_sleeping"
    t.boolean "required_attendance"
    t.text "last_weather_conditions"
    t.datetime "last_weather_check"
    t.index ["movie_id"], name: "index_locations_on_movie_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "movie_money_transfers", force: :cascade do |t|
    t.integer "movie_id"
    t.string "budget_type"
    t.float "budget_amount"
    t.integer "user_id"
    t.integer "actor_id"
    t.integer "item_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["movie_id"], name: "index_movie_money_transfers_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
    t.integer "user_id"
    t.index ["schedule_id"], name: "index_movies_on_schedule_id"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_permissions_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_permissions_on_name"
    t.index ["resource_type", "resource_id"], name: "index_permissions_on_resource_type_and_resource_id"
  end

  create_table "ride_events", force: :cascade do |t|
    t.integer "location_id"
    t.integer "duration"
    t.integer "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "scheduled_on"
    t.integer "scheduled_after_id"
    t.integer "estimate"
    t.index ["car_id"], name: "index_ride_events_on_car_id"
    t.index ["location_id"], name: "index_ride_events_on_location_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
  end

  create_table "roles_scenes", force: :cascade do |t|
    t.integer "role_id"
    t.integer "scene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_scenes_on_role_id"
    t.index ["scene_id"], name: "index_roles_scenes_on_scene_id"
  end

  create_table "scenes", force: :cascade do |t|
    t.integer "movie_id"
    t.string "name"
    t.string "description"
    t.integer "duration"
    t.integer "order"
    t.integer "inventory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_scenes_on_inventory_id"
    t.index ["movie_id"], name: "index_scenes_on_movie_id"
  end

  create_table "schedule_event_casts", force: :cascade do |t|
    t.integer "schedule_event_id"
    t.integer "cast_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cast_id"], name: "index_schedule_event_casts_on_cast_id"
    t.index ["schedule_event_id"], name: "index_schedule_event_casts_on_schedule_event_id"
  end

  create_table "schedule_events", force: :cascade do |t|
    t.string "schedulable_type"
    t.integer "schedulable_id"
    t.datetime "scheduled_on"
    t.integer "scheduled_after_id"
    t.integer "duration"
    t.integer "status"
    t.integer "location_id"
    t.integer "inventory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
    t.integer "position"
    t.index ["inventory_id"], name: "index_schedule_events_on_inventory_id"
    t.index ["location_id"], name: "index_schedule_events_on_location_id"
    t.index ["schedule_id"], name: "index_schedule_events_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "movie_id"
    t.string "title"
    t.datetime "scheduled_from"
    t.datetime "scheduled_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_schedules_on_movie_id"
  end

  create_table "shoot_events", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "schedule_event_id"
    t.integer "scene_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estimate"
    t.datetime "scheduled_on"
    t.integer "location_id"
    t.index ["location_id"], name: "index_shoot_events_on_location_id"
    t.index ["scene_id"], name: "index_shoot_events_on_scene_id"
    t.index ["schedule_event_id"], name: "index_shoot_events_on_schedule_event_id"
    t.index ["schedule_id"], name: "index_shoot_events_on_schedule_id"
  end

  create_table "simulation_jobs", force: :cascade do |t|
    t.integer "simulation_id"
    t.string "simulation_job_type"
    t.string "simulation_job_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["simulation_id"], name: "index_simulation_jobs_on_simulation_id"
  end

  create_table "simulation_results", force: :cascade do |t|
    t.integer "simulation_id"
    t.string "simulation_job_type"
    t.integer "healthy_status"
    t.boolean "emailed"
    t.datetime "emailed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["simulation_id"], name: "index_simulation_results_on_simulation_id"
  end

  create_table "simulations", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_simulations_on_movie_id"
    t.index ["user_id"], name: "index_simulations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "watchdog_credits"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_permissions", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.index ["permission_id"], name: "index_users_permissions_on_permission_id"
    t.index ["user_id", "permission_id"], name: "index_users_permissions_on_user_id_and_permission_id"
    t.index ["user_id"], name: "index_users_permissions_on_user_id"
  end

  create_table "watchdogs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.string "watchdog_type"
    t.text "data"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
