class CreateTeamsHaveVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_have_volunteers do |t|
      t.references :team, null: false, foreign_key: true
      t.references :volunteer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
