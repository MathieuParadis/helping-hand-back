class Position < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :lat, presence: true, numericality: { in: -90..90 }
  validates :lng, presence: true, numericality: { in: -180..180 }
end
