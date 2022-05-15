class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.all

    # if current_user
    #   render json: @requests, status: :created
    # else
    #   render json: { error: "please log in" }, status: :unprocessable_entity
    # end  

    render json: @requests, status: :created
  end

  # GET /user-requests
  def index_user_requests
    @requests = Request.where(user: current_user)

    # if current_user
    #   render json: @requests, status: :created
    # else
    #   render json: { error: "please log in" }, status: :unprocessable_entity
    # end  

    render json: @requests, status: :created
    end


  # GET /requests/1
  def show
    render json: @request
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    @request.user = current_user

    if @request.save
      render json: { message: "Request created successfully" }, status: :created
    else
      render json: { error: @request.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      render json: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Request not found' }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.permit(:id, :title, :request_type, :location, :lat, :lng, :description)
    end
end
