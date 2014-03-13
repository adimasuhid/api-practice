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
    user = User.where(email: user_params[:email]).first

    response = if user.valid_password? user_params[:password]
      { status: 200, access_token: user.access_token }
    else
      { status: 403 }
    end

    render json: response
  end

private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
