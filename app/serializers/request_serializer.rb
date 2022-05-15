class RequestSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :request_type, :location, :lat, :lng, :description, :status, :count, :user
  
end