class Address < ApplicationRecord
  encrypts :cep, :street, :number, :city, :state , deterministic: true
end
