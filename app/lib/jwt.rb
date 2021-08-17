require 'net/http'
require 'uri'

class Jwt

  @@domain = (Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:domain] : Rails.application.credentials.auth0_prod[:domain]
  @@api_identifier =(Rails.env.test? or Rails.env.development?) ? Rails.application.credentials.auth0_dev[:api_identifier] : Rails.application.credentials.auth0_prod[:api_identifier]

  def self.verify(token)

    JWT.decode(token, nil,
               true, # Verify the signature of this token
               algorithm: 'RS256',
               iss: @@domain,
               verify_iss: true,
               aud: @@api_identifier,
               verify_aud: true) do |header|
      jwks_hash[header['kid']]
    end
  end

  def self.jwks_hash
    jwks_raw = Net::HTTP.get URI("#{@@domain}.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
        .map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
  end
end