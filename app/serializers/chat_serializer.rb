class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title, :request_id, :request
end
