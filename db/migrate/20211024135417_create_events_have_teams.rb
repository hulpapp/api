class CreateEventsHaveTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :events_have_teams do |t|
      t.references :event, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
