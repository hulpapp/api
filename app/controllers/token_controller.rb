require 'openssl'
require 'net/http'
require 'uri'

class TokenController < ApplicationController

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      @volunteer = Volunteer.find_by_user_id(@user.id)
      token = Jwt.encode({user_id: @user.id,role: @volunteer.user_role },)
      render json: { token: token, exp: 24.hours.from_now
                     }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end



end
