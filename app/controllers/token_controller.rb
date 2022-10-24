require 'openssl'
require 'net/http'
require 'uri'
require 'bcrypt'

class TokenController < ApplicationController
  include BCrypt

  def login
    @user = User.find_by_email(params[:email])
    status = 401

    unless @user.nil?
      if @user&.authenticate(params[:password])
        status=201
        @roles = Role.where(user_id: @user.id)
        @volunteer = Volunteer.find_by_user_id(@user.id)
        token = Jwt.encode({ user_id: @user.id, volunteer_data: @volunteer.as_json, roles: @roles.as_json})
        render json: { token: token, exp: 24.hours.from_now
        }, status: :ok

      end

    end

    if status.eql?(401)
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end



end
