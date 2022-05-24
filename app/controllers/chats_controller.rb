class ChatsController < ApplicationController

  def index
    chats = Chat.all
    render json: chats
  end

  def create
    p params
    chat = Chat.new
    chat.request = Request.find(params[:request_id])
    chat.title = chat.request.title

    p chat.request.user

    if chat.save
      # serialized_data = ActiveModelSerializers::Adapter::Json.new(chatSerializer.new(chat)).serializable_hash
      # ActionCable.server.broadcast 'chats_channel', serialized_data
      # head :ok

      # serialized_data = ActiveModelSerializers::Adapter::Json.new(chatSerializer.new(chat)).serializable_hash
      ActionCable.server.broadcast 'chats_channel', chat
      # head :ok
      render json: { message: "Request created successfully" }, status: :created
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:id, :request_id)
  end

end
