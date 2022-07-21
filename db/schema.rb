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

ActiveRecord::Schema[7.0].define(version: 2022_07_20_003137) do
  create_table "items", force: :cascade do |t|
    t.text "demo_badge"
    t.boolean "demo_boolean"
    t.text "demo_code"
    t.text "demo_country"
    t.date "demo_date"
    t.datetime "demo_datetime"
    t.text "demo_external_image"
    t.binary "demo_file"
    t.binary "demo_files"
    t.text "demo_gravatar"
    t.text "demo_markdown"
    t.integer "demo_number"
    t.text "demo_password"
    t.integer "demo_progress_bar"
    t.integer "demo_select"
    t.text "demo_status"
    t.text "demo_text"
    t.text "demo_textarea"
    t.text "demo_trix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
