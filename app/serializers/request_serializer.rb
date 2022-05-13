class RequestSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :request_type, :location, :lat, :lgn, :description, :user
  
end