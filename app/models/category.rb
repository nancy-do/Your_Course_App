class Category < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
    
    has_and_belongs_to_many :courses
    # has_many :courses
end
