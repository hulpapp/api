require 'swagger_helper'

RSpec.describe 'api/volunteer', type: :request do
  path '/volunteers' do
    post '/volunteers' do
      tags 'Volunteer'
      consumes 'application/json'
      parameter name: :volunteer_id, in: :body, schema:{
        type: :object,
        properties: {
          name: {type: :string},
          email: {type: :string},
          telephone: {type: :string},
          cpf: {type: :string},
          identity: {type: :string},
          address_id: {type: :integer},
          user_id: {type: :integer}
        }
      }
    end
  end
end
