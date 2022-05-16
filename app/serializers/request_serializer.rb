class RequestSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :request_type, :location, :lat, :lng, :description, :status, :count, :user, :publish_date

  def lat
    object.lat.to_f
  end

  def lng
    object.lng.to_f
  end

  def status
    object.status.split("_").join(" ")
  end

  def publish_date
    object.created_at.to_s(:db)[0..9]
  end
end
