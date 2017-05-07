class Course < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
    validates :prerequisite, presence: true
    validates :description, presence: true
    validates :locations, presence: true
    validates :categories, presence: true
    
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
    belongs_to :users
end
