class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :first_name, :last_name, :id_card, :id_card_url, :email, :password, :password_confirmation, :position, :reset_password_token, :reset_password_sent_at

  def id_card
    if object.id_card.attached?
      {
        url: rails_blob_url(object.id_card)
      }
    end
  end
  
end