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

ActiveRecord::Schema.define(version: 20170419090404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_post_attachments", force: :cascade do |t|
    t.text    "title",         default: "", null: false
    t.text    "caption",       default: "", null: false
    t.text    "url",           default: "", null: false
    t.integer "media_type",                 null: false
    t.integer "blog_post_id",               null: false
    t.string  "uploaded_file"
    t.index ["blog_post_id"], name: "index_blog_post_attachments_on_blog_post_id", using: :btree
  end

  create_table "blog_posts", force: :cascade do |t|
    t.text     "title",                         null: false
    t.text     "body",                          null: false
    t.integer  "user_id",                       null: false
    t.integer  "comment_count", default: 0,     null: false
    t.integer  "media_count",   default: 0,     null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "published",     default: false, null: false
    t.index ["published"], name: "index_blog_posts_on_published", using: :btree
    t.index ["user_id"], name: "index_blog_posts_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.integer  "parent_id"
    t.string   "parent_type"
    t.text     "body",        default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["parent_id"], name: "index_comments_on_parent_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string  "taggable_type"
    t.integer "taggable_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "comments_count",         default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
