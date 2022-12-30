class UserMailer < ApplicationMailer
  default from: 'you@domain.io' # this domain must be verified with Resend
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: ["email@example.com", "email2@example.com"], subject: 'Hello World')
  end
end
