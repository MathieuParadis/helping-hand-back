class Chat < ApplicationRecord
  # Relations
  belongs_to :request
  has_many :messages
  
  # Validations
  validates :title, presence: true
end
