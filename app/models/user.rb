class User < ApplicationRecord
  # Relations
  has_secure_password

  # Validations
  validates :first_name, presence: true, length: { in: 2..100 }
  validates :last_name, presence: true, length: { in: 2..100 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }, uniqueness: true

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
