class Measurement < ApplicationRecord
  has_many :metrics
  has_many :users, through: :metrics

  belongs_to :measures
end
