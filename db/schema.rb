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

ActiveRecord::Schema[7.1].define(version: 2024_10_12_214333) do
  create_table "authors", force: :cascade do |t|
    t.string "author_name"
    t.text "author_bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_author_relations", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_author_relations_on_author_id"
    t.index ["book_id"], name: "index_book_author_relations_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "book_name"
    t.text "book_description"
    t.string "age_recomendations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.text "genre_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_list_books", force: :cascade do |t|
    t.integer "reading_list_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_list_books_on_book_id"
    t.index ["reading_list_id"], name: "index_reading_list_books_on_reading_list_id"
  end

  create_table "reading_lists", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reading_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_foreign_key "book_author_relations", "authors"
  add_foreign_key "book_author_relations", "books"
  add_foreign_key "books", "genres"
  add_foreign_key "reading_list_books", "books"
  add_foreign_key "reading_list_books", "reading_lists"
  add_foreign_key "reading_lists", "users"
end
