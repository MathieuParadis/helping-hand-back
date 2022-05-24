class Chat < ApplicationRecord
  # Relations
  belongs_to :request
  belongs_to :requester, class_name: "User"
  belongs_to :volunteer, class_name: "User"
  has_many :messages

end
