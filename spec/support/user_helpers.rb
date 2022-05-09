require 'faker'
require 'factory_bot_rails'

module UsersHelpers

  def get_id_card_url
    url_for(self.id_card)
  end
end