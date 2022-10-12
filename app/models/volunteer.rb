class Volunteer < ApplicationRecord
  belongs_to :address
  belongs_to :user
  encrypts :name, :email, :telephone, :cpf , :identity , deterministic: true
end
