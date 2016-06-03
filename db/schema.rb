ActiveRecord::Schema.define(version: 20160603094528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issue_types", force: :cascade do |t|
    t.string   "name"
    t.string   "icon_path"
    t.integer  "display_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "summary"
    t.string   "description"
    t.integer  "estimate_time"
    t.integer  "reporter_id"
    t.integer  "status_id"
    t.integer  "priority_id"
    t.integer  "type_id"
    t.integer  "sprint_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "project_id"
    t.date     "due_date"
  end

end
