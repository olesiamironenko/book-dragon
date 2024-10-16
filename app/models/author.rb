class Author < ApplicationRecord
    has_many :book_author_relations
    has_many :books, through: :book_author_relations

    validates :author_name, presence: true
end
