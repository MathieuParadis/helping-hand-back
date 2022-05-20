class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]
  # before_action :authorized
  before_action :check_status

  # GET /requests
  def index
    lat = params[:lat]
    lng = params[:lng]

    @requests = Request.where(status: "in_progress").where("count < ?", 5)
    @requests = @requests.within(15, :origin => [lat, lng])

    render json: @requests, status: :ok
  end

  # GET /user-requests
  def index_user_requests
    in_progress_requests = Request.where(user: current_user, status: "in_progress").sort{ |a, b| b.expiry_date <=> a.expiry_date }
    expired_requests = Request.where(user: current_user, status: "expired").sort{ |a, b| b.updated_at <=> a.updated_at }
    fulfilled_requests = Request.where(user: current_user, status: "fulfilled").sort{ |a, b| b.updated_at <=> a.updated_at }

    @requests = in_progress_requests + expired_requests + fulfilled_requests

    render json: @requests, status: :ok
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
    if @request.status == "fulfilled"
      render json: { error: "Request already marked as fulfilled. It cannot be edited anymore" }, status: :unprocessable_entity
      return
    end

    if @request.update(request_params)
      render json: { message: "Request updated successfully" }, status: :ok
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    if @request.user != current_user
      render json: { error: "You do not have the right to perform this action" }, status: :unprocessable_entity
      return
    end

    if @request.destroy
      render json: { message: "Request deleted successfully" }, status: :ok
    else
      render json: { error: "An error occured. Please try again!" }, status: :unprocessable_entity
    end
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
      params.permit(:id, :title, :request_type, :location, :lat, :lng, :description, :status, :count, :expiry_date, :created_at)
    end

    # Check the status of the requests and change them to expired if expiry date is passed
    def check_status
      Request.all.each do |request|
        if request.is_request_expired()
          request.status = "expired"
        end
        request.save
      end
    end
end
