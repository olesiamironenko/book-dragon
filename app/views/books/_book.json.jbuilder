json.extract! book, :id, :book_name, :book_description, :age_recomendations, :created_at, :updated_at
json.url book_url(book, format: :json)
