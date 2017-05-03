class Location < ApplicationRecord
    
    validates :building, presence: true, :uniqueness => {:scope => [:level, :room]}
    validates :level, presence: true
    validates :room, presence: true
    
    has_many :courses
    
    def locationName
        "#{building}.#{level}.#{room}"
    end



end
