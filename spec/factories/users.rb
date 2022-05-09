FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password{ "azerty123" }
    password_confirmation { "azerty123" }
    id_card { Rack::Test::UploadedFile.new('spec/files/IDcard.png', 'image/png') }
    id_card_url { 'spec/files/IDcard.png' }
  end
end
