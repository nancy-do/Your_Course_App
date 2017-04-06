class User < ApplicationRecord
  validates :name, presence: true
  validates :last, presence: true
  validates :email, presence: true
end