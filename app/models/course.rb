class Course < ApplicationRecord
    
    belongs_to :locations
    belongs_to :categories
end
