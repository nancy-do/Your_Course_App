class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  validates :name, presence: true, length: {minimum: 4}
  VALID_EMAIL_REGEX = /([a-z+]+)+\.+([a-z+]+)+@rmit.edu.au/i
  #---------------------------Checking email
  validates :email, 
    format: {with: /\b(admin)\b/},
    uniqueness: true,
    :if => Proc.new {|c| c.admin == true}

  validates :email, 
    presence: true, 
    length: {minimum: 4}, 
    format: {with: VALID_EMAIL_REGEX, message: "Email Registration only open to RMIT staff" }, 
    uniqueness: { case_sensitive: false }, 
    :unless => Proc.new {|c| c.admin == true}

  #------------------- Checking email 
  #validates :email, presence: true, length: {minimum: 4}, format: {with: VALID_EMAIL_REGEX, message: "Email Registration only open to RMIT staff" }, uniqueness: { case_sensitive: false }
  has_secure_password
  VALID_PASSWORD_REGEX = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{8,}/
  #validates :password, presence: true, length: {minimum: 8}, format: {with: VALID_PASSWORD_REGEX, message: "Password must at least contain an lower case, an upper case, a digit, a special character and contains 8+ characters"}
  #---------------------------Checking password 
  validates :password, 
    format: {with: /\b(password)\b/},
    :if => Proc.new {|c| c.admin == true}

  validates :password, 
    presence: true, 
    length: {minimum: 8}, 
    format: {with: VALID_PASSWORD_REGEX, message: "Password must at least contain an lower case, an upper case, a digit, a special character and contains 8+ characters"},
    :unless => Proc.new {|c| c.admin == true}
  #---------------------------Checking password 
  
  # with_options if: (:admin == true) do |admin|
  #   PASSWORD_REGEX = /\b(password)\b/
  #   EMAIL_REGEX = /\b(admin)\b/
  #   admin.validates :password, format: {with: PASSWORD_REGEX}
  #   admin.validates :email, format: {with: EMAIL_REGEX}
  # end 
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  has_many :courses, :dependent => :delete_all
  has_many :rates
  has_many :ratings, through: :rates
  
end