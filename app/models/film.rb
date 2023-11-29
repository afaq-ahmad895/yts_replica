class Film < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    has_one_attached :movie
end
