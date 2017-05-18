class Rate < ApplicationRecord
    
    validates :users_id, presence: true
    validates :ratings_id, presence: true
    validates :rated, presence: true
    
    validates_uniqueness_of :users_id, :scope => :ratings_id
     
     
    belongs_to :users
    belongs_to :ratings
end
