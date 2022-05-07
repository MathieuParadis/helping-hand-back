class PasswordsController < ApplicationController

  # POST /forgotten-password
  # FORGOTTEN PASSWORD
  def forgot
    # check if email is present
    if params[:email].blank? 
      return render json: { error: 'Email field is empty' }
    end

    # if present find user by email
    user = User.find_by(email: params[:email]) 

    if user.present?
      # generate password token
      user.generate_password_token! 

      # sends email with link to reset password
      UserMailer.reset_password_email(user).deliver_now

      render json: { message: 'An email was sent to your address. Please check your mailbox!'}, status: :ok
    else
      render json: { error: 'Email address not found. Please check and try again.' }, status: :not_found
    end
  end

  # POST /reset-password
  # RESET PASSWORD
  def reset
    user = User.find_by(email: params[:email]) 
    token = params[:token].to_s

    if params[:email].blank?
      return render json: { error: 'Email is missing' }
    end

    if user.present? && user.password_token_valid? && user.reset_password_token == token
      if user.reset_password!(params[:password])
        render json: { message: 'You successfully reset your password' }, status: :ok
      else
        render json: { error: 'Something went wrong. Please try again' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'User not found. Verify the email address is correct or try generating a new link' }, status: :not_found
    end
  end
end
