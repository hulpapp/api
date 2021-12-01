class AddEventToPresences < ActiveRecord::Migration[6.1]
  def change
    add_reference :presences, :event, null: false, foreign_key: true, default: 0
  end
end
