class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'https://helpping-hand.herokuapp.com/' 
    mail(to: @user.email, subject: 'Welcome to Helping Hand')
  end

  def reset_password_email(user)
    @user = user 
    @url ="https://helpping-hand.herokuapp.com/reset-password/#{user.reset_password_token}"
    mail(to: @user.email, subject: "Reset your password (Helping Hand)") 
  end

  def goodbye_email(user)
    @user = user
    @url  = 'https://helpping-hand.herokuapp.com/' 
    mail(to: @user.email, subject: "That's only a goodbye")
  end
end
