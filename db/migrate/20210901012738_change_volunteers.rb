class ChangeVolunteers < ActiveRecord::Migration[6.1]
  def change
    rename_column :volunteers, :type, :user_role
  end
end
