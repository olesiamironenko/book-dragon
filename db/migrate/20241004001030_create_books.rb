class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.text :book_description
      t.string :age_recomendations

      t.timestamps
    end
  end
end
