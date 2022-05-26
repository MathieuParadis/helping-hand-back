class ChatSerializer < ActiveModel::Serializer
  attributes :id, :request, :requester, :volunteer, :messages

  def request
    ActiveModel::SerializableResource.new(object.request,  each_serializer: RequestSerializer)
  end

  def messages
    ActiveModel::SerializableResource.new(object.messages,  each_serializer: MessageSerializer)
  end

end
