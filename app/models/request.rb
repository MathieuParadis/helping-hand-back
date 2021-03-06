class Request < ApplicationRecord
  # Relations
  belongs_to :user
  
  # Validations
  validates :title, presence: true, length: { in: 1..50 }
  validates :request_type, presence: true
  validates :location, presence: true
  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :description, presence: true, length: { in: 1..300 }
  validates :status, presence: true
  validates :count, presence: true
  validates :expiry_date, presence: true

  # Request_type options
  enum request_type: { material: "material", service: "service" }

  # Status options
  enum status: { in_progress: "in progress", fulfilled: "fulfilled", expired: "expired" }

  # Geokit rails
  acts_as_mappable :default_units => :kms,
  :default_formula => :sphere,
  :distance_field_name => :distance,
  :lat_column_name => :lat,
  :lng_column_name => :lng

  # Methods
  after_initialize :set_expiry_date
  after_create :request_created
  after_update :request_expired, :request_fulfilled

  def set_expiry_date
    self.expiry_date ||= Integer(Time.current.utc) + (86400)
  end

  def request_created
    RequestMailer.request_created_email(self).deliver_now
  end

  def request_expired
    if self.status == "expired"
      RequestMailer.request_expired_email(self).deliver_now
    end
  end

  def request_fulfilled
    if self.status == "fulfilled"
      RequestMailer.request_fulfilled_email(self).deliver_now
    end
  end

  def is_request_expired
    if (Integer(Time.current.utc) > self.expiry_date && self.status != "fulfilled")
      return true
    else 
      return false
    end
  end

end
