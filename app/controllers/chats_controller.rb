class ChatsController < ApplicationController
  before_action :authorized

  def index
    chats = Chat.where(requester: current_user) + Chat.where(volunteer: current_user)
    chats = chats.sort{ |a, b| b.messages.last.updated_at <=> a.messages.last.updated_at }
    render json: chats, status: :ok
  end

  def create
    chat = Chat.new(chat_params)

    if chat.save
      serialized_chat = ActiveModel::SerializableResource.new(chat)
      ActionCable.server.broadcast 'chats_channel', serialized_chat
      render json: chat, status: :created
    else 
      render json: { error: "An error occured. Please try again!" }, status: :unprocessable_entity
    end
  end
  
  private
  
  def chat_params
    params.permit(:id, :request_id, :requester_id, :volunteer_id)
    # params.require(:chat).permit(:id, :request_id, :requester_id, :volunteer_id)
  end

end
