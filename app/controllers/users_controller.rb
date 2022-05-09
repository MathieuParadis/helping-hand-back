class UsersController < ApplicationController
  before_action :authorized, except: %i[create index login]
  before_action :set_user, except: %i[create login index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/id
  def show
    render json: @user, status: :ok
  end
 
  # POST /signup
  # REGISTER
  def create
    @user = User.new(user_params)
    @user.id_card_url = @user.get_id_card_url()

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: { user: @user, token: token, message: "Account created successfully" }, status: :created
    else
      render json: { error: @user.errors }, status: :not_acceptable
    end
  end

  # POST /signin
  # LOG IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: { user: @user, token: token, message: "Logged in successfully" }
    else
      render json: { error: "Incorrect email and/or password" }, status: :unprocessable_entity
    end
  end

  # PUT /users/id
  def update
    @user.attributes = user_params
    @user.id_card_url = @user.get_id_card_url()

    if @user.save
      render json: { user: @user }
    else
      render json: { error: "Something went wrong. Please try again!" }
    end
  end

  # DELETE /users/id
  def destroy
    if @user.destroy
      render json: { message: "Account deleted successfully" }
    else
      render json: { error: "An error occured. Please try again!" }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:id, :first_name, :last_name, :id_card, :id_card_url, :email, :password, :password_confirmation)
  end
end