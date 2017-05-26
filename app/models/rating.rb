class Rating < ApplicationRecord
    
    validates :likes, presence: true
    validates :dislikes, presence: true
    validates :course_id, presence: true
    
    has_many :courses
    has_many :rates 
    has_many :users, through: :rates
end
