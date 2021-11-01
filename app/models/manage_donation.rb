class ManageDonation < ApplicationRecord
  belongs_to :event
  belongs_to :donation
end
