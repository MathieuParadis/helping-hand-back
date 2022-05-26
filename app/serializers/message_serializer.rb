class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :user, :content, :created_at

end
