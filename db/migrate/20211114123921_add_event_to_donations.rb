class AddEventToDonations < ActiveRecord::Migration[6.1]
  def change
    add_reference :donations, :event, null: true, foreign_key: true
  end
end
