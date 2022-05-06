class PasswordsController < ApplicationController

  # POST /forgotten-password
  # FORGOTTEN PASSWORD
  def forgot
    # check if email is present
    if params[:email].blank? 
      return render json: {error: 'Email field is empty'}
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
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end

  # POST /reset-password
  # RESET PASSWORD
  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: 'Token not present'}
    end

    user = User.find_by(reset_password_token: token)

    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        render json: {status: 'ok'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end


end
