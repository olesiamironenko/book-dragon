class Author < ApplicationRecord
    has_many :book_author_relations
    has_many :books, through: :book_author_relations

    acts_as_favoritable

    validates :author_name, presence: true
end
