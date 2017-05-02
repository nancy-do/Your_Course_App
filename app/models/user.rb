class User < ApplicationRecord
  validates :name, presence: true, length: {minimum: 4}
  VALID_EMAIL_REGEX = /([a-z+]+)+\.+([a-z+]+)+@rmit.edu.au/i
  # VALID_EMAIL_REGEX = /\d/
  validates :email, presence: true, length: {minimum: 4}, format: {with: VALID_EMAIL_REGEX}
end