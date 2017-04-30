class Location < ApplicationRecord
    validates :building, presence: true
    validates :level, presence: true
    validates :room, presence: true

end
