require 'net/http'
require 'uri'

class Jwt

  @@domain = (Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:domain] : Rails.application.credentials.auth0_prod[:domain]
  @@api_identifier =(Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:api_identifier] : Rails.application.credentials.auth0_prod[:api_identifier]
  @@SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.decode(token)
    decoded = JWT.decode(token, @@SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end



  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, @@SECRET_KEY)
  end
end