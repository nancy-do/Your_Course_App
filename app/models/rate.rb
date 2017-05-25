class Rate < ApplicationRecord
    
    validates :user_id, presence: true
    validates :rating_id, presence: true
    validates :rated, presence: true
    
    validates_uniqueness_of :user_id, :scope => :rating_id
     
     
    belongs_to :users
    belongs_to :ratings
end
