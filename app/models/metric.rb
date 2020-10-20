class Metric < ApplicationRecord
  has_many :measurements
  has_many :users, through: :measurements
end
