class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "from@example.com"

  def welcome_email
    @user = params[:user]
    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    @url  = "http://example.com/login"
    mail(
      to: ["to@example.com"],
      cc: ["cc@example.com"],
      bcc: ["bcc@example.com"],
      reply_to: "replyto@example.com",
      subject: "Hello from Rails",
    )
  end
end
