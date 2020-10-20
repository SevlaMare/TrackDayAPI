class Measurement < ApplicationRecord
  has_many :metrics
  has_many :users, through: :metrics

  has_many :measures
end
