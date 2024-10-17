require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    genre = Genre.create!(genre_name: "Fiction")
    book = Book.new(book_name: "Test Book", genre: genre, age_recomendations: "kids")
    expect(book).to be_valid
  end

  it "is not valid without a book_name" do
    genre = Genre.create!(genre_name: "Fiction")
    book = Book.new(book_name: nil, genre: genre, age_recomendations: "kids")
    expect(book).not_to be_valid
  end

  it "belongs to a genre" do
    genre = Genre.create!(genre_name: "Fiction")
    book = Book.new(book_name: "Test Book", genre: genre, age_recomendations: "kids")
    expect(book.genre).to eq(genre)
  end
end
