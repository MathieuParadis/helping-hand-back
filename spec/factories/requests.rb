FactoryBot.define do
  factory :request do
    title { "Request title" }
    request_type { "material" }
    location { "request location" }
    lat { 50 }
    lng { 50 }
    description { "Request description" }
  end
end
