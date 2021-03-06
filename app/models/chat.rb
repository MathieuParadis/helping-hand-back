class Chat < ApplicationRecord
  # Relations
  belongs_to :request
  belongs_to :requester, class_name: "User"
  belongs_to :volunteer, class_name: "User"
  has_many :messages

  # Methods
  after_create :first_message, :chat_created, :increment_request_count

  def first_message
    Message.create(content: "Hello #{self.requester.first_name}", chat: self, user: self.volunteer)
  end

  def chat_created
    ChatMailer.new_chat_email(self).deliver_now
  end

  def increment_request_count
    self.request.update(count: self.request.count + 1)
  end
  
end
