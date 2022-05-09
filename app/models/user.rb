class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  include ActiveModel::Validations
  
  # Relations
  has_secure_password
  has_one_attached :id_card

  # Validations
  validates :first_name, presence: true, length: { in: 2..100 }
  validates :last_name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true
  validates :id_card, file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'application/pdf'] }, if: -> { id_card.attached? }
  validates :id_card_url, presence: true, format: { with: /\A[^\s]+(\.(?i)(jpeg|jpg|png|pdf))\z/ }

  ## Methods
  after_create :welcome_send
  before_destroy :goodbye_send, prepend: true

  def get_id_card_url
    url_for(self.id_card)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def goodbye_send
    UserMailer.goodbye_email(self).deliver_now
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end
   
  def password_token_valid?
  (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end
  
  def reset_password!(password)
  self.reset_password_token = nil
  self.password = password
  save!
  end
  
  private
   
  def generate_token
  SecureRandom.hex(10)
  end
end
