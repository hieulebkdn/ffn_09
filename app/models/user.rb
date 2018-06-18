class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_COIN_REGEX = /\A\d{1,8}(\.\d{0,2})?\z/

  has_many :comments
  has_many :bets

  validates :email, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: Settings.user_email_maxlen},
    presence: true, uniqueness: {case_sensitive: false}

  validates :password, length: {minimum: Settings.user_password_minlen},
    presence: true

  validates :name, length: {maximum: Settings.user_name_maxlen},
    presence: true

  validates :coin, format: {with: VALID_COIN_REGEX},
    numericality: true

  enum role: %i(member admin)

  has_secure_password
end