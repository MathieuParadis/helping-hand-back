class PositionSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng, :user
  
end
