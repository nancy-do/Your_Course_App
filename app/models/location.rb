class Location < ApplicationRecord
    
    validates :building, presence: true, :uniqueness => {:scope => [:level, :room]}
    validates :level, presence: true
    validates :room, presence: true
    
    # has_many :courses
    has_and_belongs_to_many :courses
    
    def locationName
        # string2 = :building + "." + :level + "." + :room
        string = "#{building}.#{level}.#{room}"
        return string
    end



end
