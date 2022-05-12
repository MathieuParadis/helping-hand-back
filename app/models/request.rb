class Request < ApplicationRecord
  serialize :position, Hash

  # Validations
  validates :title, presence: true, length: { in: 2..100 }
  validates :type, presence: true
  validates :location, presence: true
  validates :position, presence: true
  validates :description, presence: true

  # Type options
  enum type: [:material, :service]

end
