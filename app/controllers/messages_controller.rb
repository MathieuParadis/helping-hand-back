class MessagesController < ApplicationController
  before_action :authorized

  def create
    message = Message.new(message_params)
    chat = Chat.find(message_params[:chat_id])

    if message.user_id != chat.requester.id && message.user.id != chat.volunteer.id
      render json: { error: "You do not have the right to perform this action" }, status: :unprocessable_entity
      return
    end

    if message.save     
      serialized_message = ActiveModel::SerializableResource.new(message)
      MessagesChannel.broadcast_to chat, serialized_message
      render json: message, status: :created
    else 
      render json: { error: "An error occured. Please try again!" }, status: :unprocessable_entity
    end
  end
  
  private
  
  def message_params
    params.permit(:content, :chat_id, :user_id)
    # params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
