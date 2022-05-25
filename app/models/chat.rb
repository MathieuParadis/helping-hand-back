class Chat < ApplicationRecord
  # Relations
  belongs_to :request
  belongs_to :requester, class_name: "User"
  belongs_to :volunteer, class_name: "User"
  has_many :messages

  # Methods
  after_create :first_message

  def first_message
    Message.create(content: "Hello #{self.requester.first_name}", chat: self, user: self.volunteer)
  end
end
