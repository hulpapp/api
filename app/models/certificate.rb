class Certificate < ApplicationRecord
  belongs_to :presence
  belongs_to :volunteer
  belongs_to :organizer
  belongs_to :event
end
