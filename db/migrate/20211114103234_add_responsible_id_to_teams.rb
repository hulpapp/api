class AddResponsibleIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :responsible_id, :integer
  end
end
