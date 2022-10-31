class Address < ApplicationRecord
  encrypts :cep, :street, :city, :state , deterministic: true
end
