class Message < ApplicationRecord
  # Relations
  belongs_to :chat
  belongs_to :user

  # Validations
  validates :content, presence: true

end
