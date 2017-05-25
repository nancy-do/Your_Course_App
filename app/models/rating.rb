class Rating < ApplicationRecord
    
    has_many :courses, :dependent => :delete_all
    has_many :rates 
    has_many :users, through: :rates
end
