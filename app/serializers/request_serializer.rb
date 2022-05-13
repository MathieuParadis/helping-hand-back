class RequestSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :request_type, :location, :position, :description, :user
  
end