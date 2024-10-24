class Book < ApplicationRecord
    has_many :book_author_relations
    has_many :authors, through: :book_author_relations
    has_one_attached :book_picture
    
    belongs_to :genre

    has_many :reading_list_books
    has_many :reading_lists, through: :reading_list_books

    accepts_nested_attributes_for :authors

    validates :book_name, presence: true
    validates :age_recomendations, inclusion: { in: %w(babies kids youths adults) }
    validates :book_picture, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                              size: { less_than: 5.megabytes , message: 'should be less than 5MB' }
end
