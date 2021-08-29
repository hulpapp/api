class TeamsHaveVolunteer < ApplicationRecord
  belongs_to :team
  belongs_to :volunteer
end
