class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "onboarding@resend.dev"

  def welcome_email
    @user = params[:user]

    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    attachments.inline["inline-image"] = File.read(Rails.root.join("resources","image.png"))

    @url  = "http://example.com/login"
    mail(
      to: ["delivered@resend.dev"],
      reply_to: "delivered@resend.dev",
      subject: "Hello from Resend Ruby SDK",
      tags: {
        "name": "category", "value": "confirm_email"
      },
      headers: {
        "X-Entity-Ref-ID": "123",
      },
      options: {
        idempotency_key: "hh11bfasd",
      }
    )
  end
end
