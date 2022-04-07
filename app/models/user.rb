class User < ApplicationRecord
  has_secure_password
  has_many :vegetables, dependent: :destroy
  validates :username, uniqueness: true, presence: true, length: {minimum: 3, maximum: 25}
  validates :email, uniqueness: true, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
end