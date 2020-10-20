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

ActiveRecord::Schema.define(version: 2020_10_20_210930) do

  create_table "measurements", force: :cascade do |t|
    t.integer "value"
    t.integer "metric_id"
    t.datetime "created_at", null: false
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
  end

  create_table "measures", force: :cascade do |t|
    t.string "name"
    t.integer "measurement_id"
    t.index ["measurement_id"], name: "index_measures_on_measurement_id"
  end

  create_table "metrics", force: :cascade do |t|
    t.integer "user_id"
    t.integer "measurement_id"
    t.index ["measurement_id"], name: "index_metrics_on_measurement_id"
    t.index ["user_id"], name: "index_metrics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
