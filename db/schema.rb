# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_31_054600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer "channel_id", null: false
    t.string "subject", null: false
    t.datetime "deliver_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.text "header"
    t.text "footer"
    t.text "main_img"
    t.index ["channel_id"], name: "index_articles_on_channel_id"
    t.index ["deleted_at"], name: "index_articles_on_deleted_at"
  end

  create_table "channels", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_channels_on_organization_id"
  end

  create_table "channels_org_users", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.bigint "organizations_user_id", null: false
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_channels_org_users_on_channel_id"
    t.index ["organizations_user_id"], name: "index_channels_org_users_on_organizations_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.integer "article_id"
    t.integer "position"
    t.text "title"
    t.text "desc"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.integer "layout"
    t.string "image"
    t.index ["deleted_at"], name: "index_contents_on_deleted_at"
  end

  create_table "invites", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "token"
    t.bigint "sender_id", null: false
    t.string "receiver", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type", "item_id"], name: "index_invites_on_item_type_and_item_id"
    t.index ["sender_id"], name: "index_invites_on_sender_id"
  end

  create_table "link_groups", force: :cascade do |t|
    t.integer "channel_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position", default: 0
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organizations_users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["organization_id"], name: "index_organizations_users_on_organization_id"
    t.index ["user_id"], name: "index_organizations_users_on_user_id"
  end

  create_table "saved_links", force: :cascade do |t|
    t.integer "link_group_id"
    t.string "url"
    t.string "subject"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position", default: 0
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.bigint "channel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_subscribers_on_channel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "channels"
  add_foreign_key "channels", "organizations"
  add_foreign_key "channels_org_users", "channels"
  add_foreign_key "channels_org_users", "organizations_users"
  add_foreign_key "organizations_users", "organizations"
  add_foreign_key "organizations_users", "users"
  add_foreign_key "subscribers", "channels"
end
