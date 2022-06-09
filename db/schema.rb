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

ActiveRecord::Schema[7.0].define(version: 2022_06_07_151039) do
  create_table "masterplan2ds", force: :cascade do |t|
    t.string "imageurl"
    t.string "name"
    t.integer "orginalwidth"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.json "phasedetails"
    t.integer "masterplan2d_id"
    t.index ["masterplan2d_id"], name: "index_phases_on_masterplan2d_id"
  end

  create_table "phasesproperties", force: :cascade do |t|
    t.string "phasename"
    t.string "propertytype"
    t.integer "price"
    t.integer "area"
    t.boolean "hasgarden"
    t.integer "nofbedrooms"
    t.boolean "hasroof"
  end

end
