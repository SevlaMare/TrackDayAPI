class User < ApplicationRecord
  has_many :measurements # , dependent: :destroy
  has_many :metrics, through: :measurements

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name,
    presence: true,
    uniqueness: true,
    length: { in: 3..12 }

  validates :email,
    presence: true,
    length: { in: 5..27 },
    uniqueness: { case_sensitive: false },
    format: { with: EMAIL_REGEX, on: :create }

  validates :password, presence: true, length: { in: 5..27 }
end
