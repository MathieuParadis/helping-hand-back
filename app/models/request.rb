class Request < ApplicationRecord
  # Relations
  belongs_to :user
  
  # Validations
  validates :title, presence: true, length: { in: 1..50 }
  validates :request_type, presence: true
  validates :location, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :description, presence: true, length: { in: 1..300 }
  validates :status, presence: true
  validates :count, presence: true

  # Request_type options
  enum request_type: { material: "material", service: "service" }

  # Status options
  enum status: { in_progress: "in progress", fulfilled: "fulfilled", expired: "expired" }

  # geokit rails
  acts_as_mappable :default_units => :kms,
  :default_formula => :sphere,
  :distance_field_name => :distance,
  :lat_column_name => :lat,
  :lng_column_name => :lng

end
