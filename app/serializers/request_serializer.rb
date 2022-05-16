class RequestSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :request_type, :location, :lat, :lng, :description, :status, :count, :user

  def lat
    object.lat.to_f
  end

  def lng
    object.lng.to_f
  end

  def status
    # object.split("_").join(" ")
    # object.class
    return object.status.split("_").join(" ")
  end
end
