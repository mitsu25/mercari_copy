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

ActiveRecord::Schema.define(version: 20170715040819) do

  create_table "buyers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_buyers_on_item_id", using: :btree
    t.index ["user_id"], name: "index_buyers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "root_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["root_category_id"], name: "index_categories_on_root_category_id", using: :btree
  end

  create_table "followers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",          null: false
    t.integer  "followed_user_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["followed_user_id"], name: "index_followers_on_followed_user_id", using: :btree
    t.index ["user_id"], name: "index_followers_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                          null: false
    t.integer  "price",                         null: false
    t.text     "description",     limit: 65535, null: false
    t.string   "brand"
    t.integer  "sub_category_id",               null: false
    t.integer  "size_id"
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.integer  "status",                        null: false
    t.integer  "delivery_fee",                  null: false
    t.integer  "delivery_by",                   null: false
    t.integer  "delivery_from",                 null: false
    t.integer  "delivery_untill",               null: false
    t.integer  "stock_status"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
    t.index ["sub_category_id"], name: "index_items_on_sub_category_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "root_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                                null: false
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_name_kana"
    t.string   "first_name_kana"
    t.string   "zip_code"
    t.string   "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "building"
    t.string   "telephone"
    t.string   "campany"
    t.integer  "number"
    t.integer  "expire_year"
    t.integer  "expire_month"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
