class MessagesController < ApplicationController
  before_action :authorized, only: [:create]

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
      # render json: { error: "An error occured. Please try again!" }, status: :unprocessable_entity
      render json: { error: message.errors}, status: :unprocessable_entity
    end
  end

  def update
    message = Message.find(message_params[:id])
    chat = Chat.find(message_params[:chat_id])

    if message.user_id != chat.requester.id && message.user.id != chat.volunteer.id
      render json: { error: "You do not have the right to perform this action" }, status: :unprocessable_entity
      return
    end

    if message.update(message_params)   
      # serialized_message = ActiveModel::SerializableResource.new(message)
      # MessagesChannel.broadcast_to chat, serialized_message
      render json: message, status: :ok
    else 
      render json: { error: "An error occured. Please try again!" }, status: :unprocessable_entity
    end
  end
  
  private
  
  def message_params
    params.permit(:id, :content, :read_status, :chat_id, :user_id)
    # params.require(:message).permit(:content, :read_status, :chat_id, :user_id)
  end
end
