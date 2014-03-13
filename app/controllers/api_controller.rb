class ApiController < ApplicationController

  def register
    user = User.new user_params

    response = if user.save
      { status: 200, access_token: user.access_token }
    else
      { status: 403 }
    end

    render json: response
  end

  def login
    render json: { status: 200 }
  end

private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
