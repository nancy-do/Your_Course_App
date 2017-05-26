class Rating < ApplicationRecord
    
    has_many :courses
    has_many :rates 
    has_many :users, through: :rates
end
