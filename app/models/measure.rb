class Measure < ApplicationRecord
  has_many :measurements

  validates :name, presence: true, length: { maximum: 22 }
end
