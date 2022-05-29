class RequestMailer < ApplicationMailer
  def request_created_email(request)
    @request = request
    @url  = 'https://helpping-hand.herokuapp.com/my-requests/' 
    mail(to: @request.user.email, subject: "Your new request - #{@request.title} - is online")
  end
end
