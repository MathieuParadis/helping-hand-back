class RequestMailer < ApplicationMailer
  def request_created_email(request)
    @request = request
    @url  = 'https://helpping-hand.herokuapp.com/my-requests/' 
    mail(to: @request.user.email, subject: "Your new request '#{@request.title}' is online")
  end

  def request_expired_email(request)
    @request = request
    mail(to: @request.user.email, subject: "Your request '#{@request.title}' has expired")
  end

  def request_fulfilled_email(request)
    @request = request
    mail(to: @request.user.email, subject: "Your request '#{@request.title}' has been marked as fulfilled")
  end
end
