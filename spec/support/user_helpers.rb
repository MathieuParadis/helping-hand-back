require 'faker'
require 'factory_bot_rails'

module UsersHelpers

  def get_id_card_url(id_card)
    url_for(id_card)
  end

  def create_rider
    FactoryBot.create(:user
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      password{ "azerty123" }
      password_confirmation { "azerty123" }
    )
  end

  def create_rider
    FactoryBot.build(:user
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      password{ "azerty123" }
      password_confirmation { "azerty123" }
    )
  end
end