class Film < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :year, presence: true
    validates :genre, presence: true
    has_many :images
    accepts_nested_attributes_for :images

end
