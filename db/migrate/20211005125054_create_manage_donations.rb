class CreateManageDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :manage_donations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :donation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
