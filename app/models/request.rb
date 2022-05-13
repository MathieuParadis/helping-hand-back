class Request < ApplicationRecord
  # Relations
  belongs_to :user
  
  # Validations
  validates :title, presence: true, length: { in: 2..50 }
  validates :request_type, presence: true
  validates :location, presence: true, length: { in: 2..50 }
  validates :lat, presence: true
  validates :lgn, presence: true
  validates :description, presence: true, length: { in: 10..300 }

  # Type options
  # enum request_type: ["material", "service"]

end
