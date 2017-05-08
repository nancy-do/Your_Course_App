class Location < ApplicationRecord
    
    validates :building, presence: true, :uniqueness => {:scope => [:level, :room]}, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 1000 , only_interger: true}
    validates :level, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 30 , only_interger: true}
    validates :room, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100, only_interger: true}
    
    # has_many :courses
    has_and_belongs_to_many :courses
    
    def locationName
        "#{building}.#{level}.#{room}"
    end



end
