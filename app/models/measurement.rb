class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :measure

  validates :value, presence: true, length: { maximum: 12 }
end
