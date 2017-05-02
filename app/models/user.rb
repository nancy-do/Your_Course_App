class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  validates :name, presence: true, length: {minimum: 4}
  VALID_EMAIL_REGEX = /([a-z+]+)+\.+([a-z+]+)+@rmit.edu.au/i
  # VALID_EMAIL_REGEX = /\d/
  validates :email, presence: true, length: {minimum: 4}, format: {with: VALID_EMAIL_REGEX, message: "Email Registration only open to RMIT staff" }, uniqueness: { case_sensitive: false }
end