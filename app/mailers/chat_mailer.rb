class ChatMailer < ApplicationMailer
  def new_chat_email(chat)
    @chat = chat
    @url  = 'https://helpping-hand.herokuapp.com/my-chats/' 
    mail(to: @chat.requester.email, subject: "#{@chat.request.title}: new chat with #{@chat.volunteer.first_name}")
  end
end
