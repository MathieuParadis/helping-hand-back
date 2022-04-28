class UsersController < ApplicationController
  before_action :authorized, except: %i[create index login]
  before_action :set_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/id
  def show
    render json: @user, status: :ok
  end
 
  # POST /users
  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: { user: @user, message: "Account created successfully" }, status: :created
      response.set_header('token', token)
    else
      render json: { error: @user.errors }, status: :not_acceptable
    end
  end

  # POST /users
  # LOG IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, message: "Logged in successfully"}
      response.set_header('token', token)
    else
      render json: {error: @user.errors}
    end
  end

  # PUT /users/id
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/id
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find_by_email(params[:email])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end