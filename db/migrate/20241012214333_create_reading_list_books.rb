class CreateReadingListBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :reading_list_books do |t|
      t.references :reading_list, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
