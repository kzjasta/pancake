class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :username,   presence: true, length:{maximum:15},
                         uniqueness: {case_sensitive: false}

  validates :first_name, presence: true, length:{maximum:20}
  validates :last_name,  presence: true, length:{maximum:20}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
  validates :email,      presence: true, length:{maximum:255},
                         format: {with: VALID_EMAIL_REGEX},
                         uniqueness: {case_sensitive: false}
                         
  has_secure_password
  validates :password, length: {minimum: 7}
end
