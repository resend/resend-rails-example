class UserController < ApplicationController

  def send_hello_email
    @user = User.new(name: "derich")

    r = UserMailer.with(user: @user).welcome_email.deliver!
    render json: {status: 'ok'}
  end

  def healthz
    render json: {status: 'ok'}
  end
end
