class User < ApplicationRecord
  has_secure_password

  has_many :measurements

  validates :username,
            presence: true,
            uniqueness: true,
            length: { in: 3..12 }

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  validates :email,
            presence: true,
            length: { in: 5..27 },
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX, on: :create }

  validates :password, presence: false, length: { in: 5..27 }
end
