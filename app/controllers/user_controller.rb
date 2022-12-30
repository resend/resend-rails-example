class UserController < ApplicationController
  def healthz
    render json: {status: 'ok'}
  end
end
