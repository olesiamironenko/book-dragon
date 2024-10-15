json.extract! author, :id, :author_name, :author_bio, :created_at, :updated_at
json.url author_url(author, format: :json)
