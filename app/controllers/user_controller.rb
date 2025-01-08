class UserController < ApplicationController

  def send_hello_email
    @user = User.new(name: "derich")

    resp = UserMailer.with(user: @user).welcome_email.deliver_now

    render json: {
      email_id: resp.message_id
    }
  end

  def healthz
    render json: {status: 'ok'}
  end
end
