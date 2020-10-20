class User < ApplicationRecord
  has_many :measurements # , dependent: :destroy
  has_many :metrics, through: :measurements
end
