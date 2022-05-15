class RequestSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :request_type, :location, :lat, :lng, :description, :status, :count, :user

end
