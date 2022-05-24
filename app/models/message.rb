class Message < ApplicationRecord
  # Relations
  belongs_to :chat

  # Validations
  validates :content, presence: true

end
