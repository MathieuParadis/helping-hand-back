class ChatsController < ApplicationController

  def index
    chats = Chat.all.sort{ |a, b| b.updated_at <=> a.updated_at }
    render json: chats

  end

  def create
  
    chat = Chat.new(chat_params)
    # chat.request = Request.find(params[:request_id])

    p chat.request
    p chat.requester
    p chat.volunteer

    if chat.save
      # serialized_data = ActiveModelSerializers::Adapter::Json.new(chatSerializer.new(chat)).serializable_hash
      # ActionCable.server.broadcast 'chats_channel', serialized_data
      # head :ok

      # serialized_data = ActiveModelSerializers::Adapter::Json.new(chatSerializer.new(chat)).serializable_hash
      # ActionCable.server.broadcast 'chats_channel', chat
      # head :ok
      render json: chat, status: :created
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:id, :request_id, :requester_id, :volunteer_id)
  end

end
