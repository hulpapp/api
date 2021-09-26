class EventsHaveLocal < ApplicationRecord
  belongs_to :event
  belongs_to :local
end
