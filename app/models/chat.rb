class Chat < ApplicationRecord
  # Relations
  belongs_to :request
  has_many :messages
  
end
