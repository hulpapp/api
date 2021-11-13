class AddUsersToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :user, default: '', null: false, foreign_key: true
  end
end
