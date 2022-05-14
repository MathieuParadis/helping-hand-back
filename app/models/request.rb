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
  validates :status, presence: true
  validates :count, presence: true

  # Request_type options
  enum request_type: { material: "material", service: "service" }

  # Status options
  enum status: { in_progress: "in progress", fulfilled: "fulfilled" }

end
