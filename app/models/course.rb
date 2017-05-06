class Course < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
    validates :prerequisite, presence: true
    validates :description, presence: true
    
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
end
