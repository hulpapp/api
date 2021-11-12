class AddEventToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :event, null: false, foreign_key: true
  end
end
