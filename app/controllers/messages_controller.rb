class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    chat = Chat.find(message_params[:chat_id])

    p 'controler'
    p chat.id
    
    if message.save     
      serialized_message = ActiveModel::SerializableResource.new(message)
      MessagesChannel.broadcast_to chat, serialized_message
      render json: message, status: :created
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
