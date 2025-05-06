class UserMailer < ApplicationMailer
  # this domain must be verified with Resend
  default from: "onboarding@resend.dev"

  def welcome_email
    @user = params[:user]
    attachments["invoice.pdf"] = File.read(Rails.root.join("resources","invoice.pdf"))
    @url  = "http://example.com/login"
    mail(
      to: ["delivered@resend.dev"],
      reply_to: "delivered@resend.dev",
      subject: "Hello from Rails",
      tags: {
        "name": "category", "value": "confirm_email"
      },
      headers: {
        "X-Entity-Ref-ID": "123",
      },
      options: {
        idempotency_key: "99a",
      }
    )
  end
end
