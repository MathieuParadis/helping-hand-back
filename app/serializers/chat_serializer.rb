class ChatSerializer < ActiveModel::Serializer
  attributes :id, :request, :requester, :volunteer

  def request
    ActiveModel::SerializableResource.new(object.request,  each_serializer: RequestSerializer)
  end

end
