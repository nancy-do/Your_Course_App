class Course < ApplicationRecord
    
    # validates :name, :presence => true, :uniqueness => true
    #validates :prerequisite, :presence => false
    #validates :description, :presence => true
    validates :categories, :presence => true
    validates :locations, :presence => true
    
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
    # belongs_to_many :locations
    # belongs_to_many :categories
end
