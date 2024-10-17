require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /book" do
    it "works! (now write some real specs)" do
      genre = Genre.create!(genre_name: "Test genre")
      book = Book.create!(book_name: "Test Book", genre: genre, age_recomendations: "kids")  # 
      get book_path(book)  # Pass the book object to generate the correct path with ID
      expect(response).to have_http_status(200)
    end
  end
end

