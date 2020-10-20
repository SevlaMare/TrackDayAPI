class Metric < ApplicationRecord
  belongs_to :user
  belongs_to :measurement
end
