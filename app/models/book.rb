class Book < ApplicationRecord
    validates :age_recomendations, inclusion: { in: %w(babies kids youths adults) }
end
