class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :user, :content, :read_status, :created_at

end
