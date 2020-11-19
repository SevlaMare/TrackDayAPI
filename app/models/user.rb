class User < ApplicationRecord
  has_secure_password

  has_many :measurements

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 3..12 }

  validates :password,
            presence: true,
            length: { in: 5..27 }

  # EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  # validates :email,
  #           presence: false,
  #           length: { in: 5..27 },
  #           uniqueness: { case_sensitive: false },
  #           format: { with: EMAIL_REGEX, on: :create }
end
