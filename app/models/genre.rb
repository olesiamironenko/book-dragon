class Genre < ApplicationRecord
    has_many :books

    validates :genre_name, presence: true
end
