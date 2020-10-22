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
end
