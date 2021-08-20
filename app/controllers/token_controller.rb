require 'openssl'
require 'net/http'
require 'uri'

class TokenController < ApplicationController

  @@domain = (Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:domain] : Rails.application.credentials.auth0_prod[:domain]
  @@api_identifier =(Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:api_identifier] : Rails.application.credentials.auth0_prod[:api_identifier]
  @@client_id = (Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:client_id] : Rails.application.credentials.auth0_prod[:client_id]
  @@client_secret = (Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:client_secret] : Rails.application.credentials.auth0_prod[:client_secret]


  def temp_token
    if Rails.env.development?
      render json: {"access_token" => "Bearer #{Rails.application.credentials.temp_token}", }
    end
  end
  def authorize
    if params[:keyword] == "#{Rails.application.credentials.keyword}"

      url = URI("#{@@domain}oauth/token")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(url)
      request["content-type"] = 'application/json'
      request.body = "{\"client_id\":\"#{@@client_id}\",\"client_secret\":\"#{@@client_secret}\",\"audience\":\"#{@@api_identifier}\",\"grant_type\":\"client_credentials\"}"

      response = http.request(request)
      render json: response.read_body
    else

      render json: 401

      end


  end



end
