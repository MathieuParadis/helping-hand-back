class Request < ApplicationRecord
  serialize :position, Hash

  # Relations
  belongs_to :user

  # Validations
  validates :title, presence: true, length: { in: 2..50 }
  validates :type, presence: true
  validates :location, presence: true, length: { in: 2..50 }
  validates :position, presence: true
  validates :description, presence: true, length: { in: 10..300 }

  # Type options
  enum type: [:material, :service]

end
