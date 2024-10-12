class Book < ApplicationRecord
    has_many :book_author_relations
    has_many :authors, through: :book_author_relations
    belongs_to :genre

    accepts_nested_attributes_for :authors

    validates :age_recomendations, inclusion: { in: %w(babies kids youths adults) }
end
