class Location < ApplicationRecord
    validates :roomNo, presence: true
end
