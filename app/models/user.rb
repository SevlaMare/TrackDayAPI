class User < ApplicationRecord
  has_many :metrics # , dependent: :destroy
  has_many :measurements, through: :metrics

  validates :name,
            presence: true,
            uniqueness: true,
            length: { in: 3..12 }

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  validates :email,
            presence: true,
            length: { in: 5..27 },
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX, on: :create }

  validates :password, presence: true, length: { in: 5..27 }
end
