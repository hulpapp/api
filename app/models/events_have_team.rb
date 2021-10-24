class EventsHaveTeam < ApplicationRecord
  belongs_to :event
  belongs_to :team
end
