class Position < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :lat, presence: true
  validates :lng, presence: true

end
