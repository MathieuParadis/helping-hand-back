class ChatsController < ApplicationController

  def index
    chats = Chat.where(requester: current_user) + Chat.where(volunteer: current_user)
    chats = chats.sort{ |a, b| b.messages.last.updated_at <=> a.messages.last.updated_at }
    render json: chats
  end

  # def index
  #   chats = Chat.all
  #   render json: chats
  # end

  def create
    chat = Chat.new(chat_params)

    if chat.save
      serialized_chat = ActiveModel::SerializableResource.new(chat)
      ActionCable.server.broadcast 'chats_channel', serialized_chat
      render json: chat, status: :created
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:id, :request_id, :requester_id, :volunteer_id)
  end

end
