class Course < ApplicationRecord
    validates :name , presence: true, length: {minimum: 10}
    validates :prerequisite, presence: true, length: {minimum: 10}
    validates :description, presence: true, length: {minimum: 30}
end
