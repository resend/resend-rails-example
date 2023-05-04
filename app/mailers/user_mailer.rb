class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "r@recomendo.io"

  def welcome_email
    @user = params[:user]
    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    @url  = "http://example.com/login"
    mail(
      to: ["carlosderich@gmail.com"],
      cc: ["d.erich@hotmail.com"],
      bcc: ["d.erich@hotmail.com"],
      reply_to: "carlosderich@gmail.com",
      subject: "Hello from Rails",
    )
  end
end
