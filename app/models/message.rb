class Message < ApplicationRecord
  # Relations
  belongs_to :chat
  belongs_to :user

  # Validations
  validates :content, presence: true
  validates :read_status, presence: true

  # Read status options
  enum read_status: { unread: "unread", read: "read" }

end
