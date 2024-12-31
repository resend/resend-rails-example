class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "onboarding@resend.dev"

  def welcome_email
    @user = params[:user]

    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))

    headers["custom-header"] = "value"
    headers["custom-header2"] = "value2"

    @url  = "http://example.com/login"
    mail(
      to: ["delivered@resend.dev"],
      reply_to: "delivered@resend.dev",
      subject: "Hello from Rails",
      bcc: "bcc@resend.dev",
      cc: "cc@resend.dev",
      tags: {
        "name": "category", "value": "confirm_email"
      },
      headers: {
        "custom-header2": "overwritten header value",
        "custom-header3": "value3"
      },
    )
  end
end
